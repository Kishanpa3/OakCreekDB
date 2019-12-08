class RemovingAge < ActiveRecord::Migration[6.0]
  def change
    change_table :animals do |t|
      t.remove :age
      t.remove :age_units
    end
  end
end
