class CreateAnimalProfileImagesTable < ActiveRecord::Migration[6.0]
  def change
    create_table :animal_profile_images do |t|
      t.references :animal,    null: false, foreign_key: true, index: true
      t.references :document,  null: false, foreign_key: true
      t.timestamps null: false
    end
  end
end
