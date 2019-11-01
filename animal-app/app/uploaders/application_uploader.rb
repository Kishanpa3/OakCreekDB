class ApplicationUploader < Shrine
  Attacher.validate { validate_max_size 5*1024*1024 }
end 