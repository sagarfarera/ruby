class ChangeInColumnOfEntityCartId < ActiveRecord::Migration[6.1]
  def change
    change_column :entities, :cart_id, :integer, null: true
  end
end
