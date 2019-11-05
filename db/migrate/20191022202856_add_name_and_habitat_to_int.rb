class AddNameAndHabitatToInt < ActiveRecord::Migration[6.0]
  def change
    add_column :animals, :name, :string  
    change_column :animals, :habitat_num, :integer
  end
end
