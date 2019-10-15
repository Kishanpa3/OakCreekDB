class CreateAnimals < ActiveRecord::Migration[6.0]
  def change
    create_table :animals do |t|
      t.string :exhibit
      t.string :commonName

      t.timestamps
    end
  end
end
