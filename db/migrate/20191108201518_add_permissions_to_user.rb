class AddPermissionsToUser < ActiveRecord::Migration[6.0]
  def change
    change_table :users do |t|
      t.column :approved, :boolean, :default => false, :null => false
      t.column :admin, :boolean, :default => false, :null => false
      t.column :view, :boolean, :default => true, :null => false
      t.column :edit, :boolean, :default => false, :null => false
      t.column :add, :boolean, :default => false, :null => false
      t.column :delete, :boolean, :default => false, :null => false
    end
    
    add_index :users, :approved
  end
end
