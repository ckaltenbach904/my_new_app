class AddAdminFlagToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :is_admin, :boolean, default: false, null:
false
  end
end
