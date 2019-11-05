class AddAttributesToAnimals < ActiveRecord::Migration[6.0]
  def change
    change_table :animals do |t|
      t.rename :exhibit, :habitat_num
      t.column :species, :string
      t.column :sex, :string, limit: 6
      t.column :neutered, :string, limit: 3
      t.column :age, :integer
      t.column :dob, :date
      t.column :weight, :float
      t.column :tag, :string
      t.column :notes, :text
    end
  end
end
