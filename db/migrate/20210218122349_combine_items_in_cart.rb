class CombineItemsInCart < ActiveRecord::Migration[6.1]
  def up
    # replace multiple items for a single product in a cart with a
    # single item
    Cart.all.each do |cart|
      # count the number of each product in the cart
      sums = cart.entities.group(:product_id).sum(:quantity)

      sums.each do |product_id, quantity|
        if quantity > 1
          # remove individual items
          cart.entities.where(product_id: product_id).delete_all

          # replace with a single item
          item = cart.entities.build(product_id: product_id)
          item.quantity = quantity
          item.save!
        end
      end
    end
  end

  def down
    Entity.where("quantity>1").each do |entity|
      entity.quantity.times do
        Entity.create(
          cart_id: entity.cart_id,
          product_id: entity.product_id,
          quantity: 1
        )
      end

      # remove original item
      entity.destroy
    end
  end


end
