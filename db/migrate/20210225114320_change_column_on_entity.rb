class ChangeColumnOnEntity < ActiveRecord::Migration[6.1]
  def change
    change_column :entities, :order_id, :integer, null: true
  end
end
