module DocumentsHelper
  FILESIZE_UNITS = ["bytes", "kb", "mb", "gb", "tb", "pb", "eb", "zb", "yb"].freeze
  def format_bytes(bytes)
    return "0.0 B" if bytes == 0

    exp = Math.log(bytes, 1024).floor
    max_exp = FILESIZE_UNITS.length - 1
    exp = max_exp if exp > max_exp
    "%.1f%s" % [bytes.to_f / 1024 ** exp, FILESIZE_UNITS[exp]]
  end
end
