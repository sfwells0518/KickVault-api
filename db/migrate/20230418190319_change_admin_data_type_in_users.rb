class ChangeAdminDataTypeInUsers < ActiveRecord::Migration[7.0]
  def change
    change_column :users, :admin, :boolean, using: "admin::boolean", default: false
  end
end
