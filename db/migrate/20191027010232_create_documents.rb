class CreateDocuments < ActiveRecord::Migration[6.0]
  def change
    create_table :documents do |t|
      t.references :animal, foreign_key: true, index: true
      t.text :file_data

      t.timestamps
    end
  end
end
