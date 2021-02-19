class AddProductPriceToEntities < ActiveRecord::Migration[6.1]
  def change
    add_column :entities, :price, :decimal
  end
end
