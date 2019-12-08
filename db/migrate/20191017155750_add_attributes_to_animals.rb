class AddAttributesToAnimals < ActiveRecord::Migration[6.0]
  def change
    change_table :animals do |t|
      t.rename :exhibit, :habitat_num
      t.column :species, :string
      t.column :sex
      t.column :neutered
      t.column :dob, :date
      t.column :weight, :float
      t.column :tag, :string, null: false
      t.column :name, :string
      t.column :notes, :text
    end
    
    add_index :animals, :tag, unique: true
  end
end
