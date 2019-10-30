class AddNameAndHabitatToInt < ActiveRecord::Migration[6.0]
  def change
    change_table :animals do |t|
      t.column :name, :string
      t.change(:habitat_num, :string)
    end
  end
end
