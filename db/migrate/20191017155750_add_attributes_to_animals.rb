class AddAttributesToAnimals < ActiveRecord::Migration[6.0]
  def change
    change_table :animals do |t|
      t.rename :exhibit, :habitat_num
      t.column :species, :string
      t.column :sex, :string
      t.column :neutered, :string
      t.column :dob, :date
      t.column :weight, :float
      t.column :tag, :string
      t.column :name, :string
      t.column :notes, :text
    end
    
    add_index :animals, :tag, unique: true
    change_column_null :animals, :tag, false
  end
end
