class CreateAnimals < ActiveRecord::Migration[6.0]
  def change
    create_table :animals do |t|
      t.integer :exhibit
      t.string :common_name

      t.timestamps
    end
  end
end
