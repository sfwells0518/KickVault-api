class ChangeColumnTypeInProducts < ActiveRecord::Migration[7.0]
  def up
    change_column :products, :supplier_id, "integer USING CAST(supplier_id AS integer)"
  end

  def down
    change_column :products, :supplier_id, :string
  end
end
