class AddingUnits < ActiveRecord::Migration[6.0]
  def change
    change_table :animals do |t|
      t.column :weight_units, :string, limit: 3
      t.column :age_units, :string, limit: 2
    end
  end
end
