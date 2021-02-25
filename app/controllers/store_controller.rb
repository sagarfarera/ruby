class StoreController < ApplicationController
  include CurrentCart
  before_action :set_cart

  def index
    @products = Product.order(:title)
    # Playtime Task- display Time and date on top of the catalog
    @time = Time.now
  end
end
