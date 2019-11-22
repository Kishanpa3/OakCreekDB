# require "image_processing/vips"
require "image_processing/mini_magick"

class DocumentUploader < Shrine
  # # plugins and uploading logic
  # plugin :pretty_location, namespace: "/", identifier: :animal_id
  
  ALLOWED_TYPES  = %w[image/jpeg image/png image/webp]

  THUMBNAILS = {
    small:  [300, 300],
    medium: [600, 600],
    large:  [800, 800],
  }

  plugin :remove_attachment
  plugin :pretty_location, namespace: "/", identifier: :animal_id
  plugin :validation_helpers
  plugin :store_dimensions, log_subscriber: nil
  plugin :derivation_endpoint, prefix: "derivations/image"
  plugin :default_url
  plugin :remove_invalid # remove and delete files that failed validation 

  # File validations (requires `validation_helpers` plugin)
  Attacher.validate do
    case file.mime_type
    when /^image\//
      validate_size 0..50*1024*1024 # 50 MB
      if validate_mime_type %w[image/jpeg image/png image/webp image/bmp image/gif image/x-icon image/tiff]
        validate_extension %w[jpg jpeg png webp bmp gif ico cur tiff tif]
        validate_max_dimensions [5000, 5000] # 5000x5000
      end
    when /^video\//
      validate_size 0..1024*1024*1024 # 1 GB
    when /^audio\//
      validate_size 0..30*1024*1024 # 30 MB
    when /^application\//
      validate_size 0..1024*1024*1024 # 1 GB
    when /^text\//
      validate_size 0..20*1024*1024 # 20 MB
    end
  end

  # Thumbnails processor (requires `derivatives` plugin)
  Attacher.derivatives_processor do |original|
    THUMBNAILS.inject({}) do |result, (name, (width, height))|
      result.merge! name => THUMBNAILER.call(original, width, height)
    end
  end

  # Default to dynamic thumbnail URL (requires `default_url` plugin)
  Attacher.default_url do |derivative: nil, **|
    file&.derivation_url(:thumbnail, *THUMBNAILS.fetch(derivative)) if derivative
  end

  # Dynamic thumbnail definition (requires `derivation_endpoint` plugin)
  derivation :thumbnail do |file, width, height|
    THUMBNAILER.call(file, width.to_i, height.to_i)
  end

  THUMBNAILER = -> (file, width, height) do
    # ImageProcessing::Vips
    ImageProcessing::MiniMagick
      .source(file)
      .resize_to_limit!(width, height)
  end
end