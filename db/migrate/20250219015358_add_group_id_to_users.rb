class AddGroupIdToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :group_id, :bigint
  end
end
