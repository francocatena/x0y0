class AddLockVersionToUsers < ActiveRecord::Migration
  def change
    add_column :users, :lock_version, :integer, default: 0, null: false
  end
end
