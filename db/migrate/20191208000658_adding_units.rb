class AddingUnits < ActiveRecord::Migration[6.0]
  def change
    change_table :animals do |t|
      t.column :weight_units, :string
    end
  end
end
