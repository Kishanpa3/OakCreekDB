# require "image_processing/vips"
require "image_processing/mini_magick"

class ImageUploader < Shrine
  ALLOWED_TYPES  = %w[image/jpeg image/png image/webp image/bmp image/x-icon image/tiff]
  MAX_SIZE       = 50*1024*1024 # 50 MB
  MAX_DIMENSIONS = [5000, 5000] # 5000x5000

  THUMBNAILS = {
    small:  [300, 300],
  }

  plugin :remove_attachment
  plugin :pretty_location, namespace: "/", identifier: :animal_id
  plugin :validation_helpers
  plugin :store_dimensions, log_subscriber: nil
  plugin :derivation_endpoint, prefix: "derivations/image"

  # File validations (requires `validation_helpers` plugin)
  Attacher.validate do
    validate_size 0..MAX_SIZE

    if validate_mime_type ALLOWED_TYPES
      validate_max_dimensions MAX_DIMENSIONS
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