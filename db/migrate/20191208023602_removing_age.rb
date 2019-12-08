class RemovingAge < ActiveRecord::Migration[6.0]
  def change
    change_table :animals do |t|
      t.remove :age, :integer
      t.remove :age_units, :string, limit: 2
    end
  end
end
