class CreateDiets < ActiveRecord::Migration[6.0]
  def change
    create_table :diets do |t|
      t.text :instructions
      t.text :am
      t.text :pm
      t.string :dish
      t.references :animal, null: false, foreign_key: true

      t.timestamps
    end
  end
end
