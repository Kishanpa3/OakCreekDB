module DocumentsHelper
  # Convert bytes into other units
  FILESIZE_UNITS = ["B", "KB", "MB", "GB", "TB", "PB", "EB", "ZB", "YB"].freeze
  def format_bytes(bytes)
    return "0.0 B" if bytes == 0

    exp = Math.log(bytes, 1024).floor
    max_exp = FILESIZE_UNITS.length - 1
    exp = max_exp if exp > max_exp
    "%.1f%s" % [bytes.to_f / 1024 ** exp, FILESIZE_UNITS[exp]]
  end
  
  # Display file icon depending on file mime type
  def display_file_type(document)
    case document.file.mime_type
    when /^image\//
      # image_url = image_path("image.svg")
      # image_url = document.file_url(:small) unless document.file_url(:small).nil?
      # return image_url
      return "image"
    when /^video\//
      return "videocam"
    when /^audio\//
      return "volume_up"
    when /^application\//
      # case document.file.mime_type
      # when /\/pdf$/
      #   return image_path("pdf.svg")
      # when /\/zip$/
      #   return image_path("zip.svg")
      # end
      return "insert_drive_file"
    when /^text\//
      return "description"
    else
      # return image_path("document.svg")
      return "insert_drive_file"
    end
  end
  
  def infer_file_extension(mime_type)
    return nil if mime_type.nil?

    extension = infer_with_mini_mime(mime_type)
    extension = extension.upcase unless extension.nil?
    extension
  end
  
  private
  
  def infer_with_mini_mime(mime_type)
    require "mini_mime"

    info = MiniMime.lookup_by_content_type(mime_type)
    info.extension if info
  end
end
