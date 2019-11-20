class AddPermissionsToUser < ActiveRecord::Migration[6.0]
  def change
    change_table :users do |t|
      t.column :approved, :boolean, :default => false, :null => false
      t.column :admin, :boolean, :default => false, :null => false
      t.column :can_view, :boolean, :default => true, :null => false
      t.column :can_edit, :boolean, :default => false, :null => false
      t.column :can_add, :boolean, :default => false, :null => false
      t.column :can_delete, :boolean, :default => false, :null => false
    end
    
    add_index :users, :approved
  end
end
