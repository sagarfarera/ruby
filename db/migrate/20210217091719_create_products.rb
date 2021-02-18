class CreateProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :products do |t|
      t.string :title
      t.string :image_url
      t.decimal :price
      t.text :description

      t.timestamps
    end
  end
end
