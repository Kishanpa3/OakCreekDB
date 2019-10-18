class AddAttributesToAnimals < ActiveRecord::Migration[6.0]
  def change
    change_table :animals do |t|
#      t.rename :commonName, :common_name
      t.rename :exhibit, :habitat_num
      t.column :species, :string
      t.column :sex, :string, limit: 6
      t.column :neutered, :string, limit: 3
      t.column :age, :integer
      t.column :dob, :date
      t.column :weight, :float
      t.column :tag, :string
      t.column :enrichment, :string #LOOK AT ACTIVE STORAGE - CAN MAYBE ALSO USE FOR STORING PICTURES OF ANIMALS
      t.column :vaccination, :string #LOOK AT ACTIVE STORAGE - https://edgeguides.rubyonrails.org/active_storage_overview.html
    end
    
    #create_table :diets do |t|
    #  t.string :dish
    #  t.text :instructions
    #  t.text :am
    #  t.text :pm
    #end
    
    #add_column :animals, :diet_id, :integer
    #add_foreign_key :animals, :diets
  end
end
