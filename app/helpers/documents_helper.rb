module DocumentsHelper
  # Convert bytes into other units
  FILESIZE_UNITS = ["bytes", "kb", "mb", "gb", "tb", "pb", "eb", "zb", "yb"].freeze
  def format_bytes(bytes)
    return "0.0 B" if bytes == 0

    exp = Math.log(bytes, 1024).floor
    max_exp = FILESIZE_UNITS.length - 1
    exp = max_exp if exp > max_exp
    "%.1f%s" % [bytes.to_f / 1024 ** exp, FILESIZE_UNITS[exp]]
  end
  
  # Change file icon depending on file mime type
  def display_file_type(document)
    case document.file.mime_type
    when /^image\//
      return document.file_url(:small)
    when /^video\//
      return image_path("film.svg")
    when /^audio\//
      return image_path("volume-2.svg")
    when /^application\//
      case document.file.mime_type
      when /\/pdf$/
        return image_path("volume-2.svg")
      when /\/zip$/
      end
    when /^text\//
      return image_path("file-text.svg")
    else
      return image_path("volume-2.svg")
    end
  end
end
