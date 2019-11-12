class DocumentUploader < Shrine
  # plugins and uploading logic
  plugin :pretty_location, namespace: "/", identifier: :animal_id
end