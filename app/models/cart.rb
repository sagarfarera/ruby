class Cart < ApplicationRecord
  #declaration of the inverse relationship between the card and line_items basically indiacte that card can have many line_items
  #dependent is the showing ki yadi databas se cart gaya to lineitmes bhi jayega
  has_many :entities, dependent: :destroy

  #playtime task including price column in entity and using that in place of using a productprice and quantity
  def add_product(product)
    current_item = entities.find_by(product_id: product.id)
    if current_item
      current_item.quantity +=1
      current_item.price += product.price

    else
      current_item = entities.build(product_id: product.id)
      current_item.price = product.price
    end
    current_item
  end

  def total_price
    entities.to_a.sum { |item| item.price }
   end
  
end
