class AddQuantityToEntities < ActiveRecord::Migration[6.1]
  def change
    add_column :entities, :quantity, :integer, default: 1
  end
end
