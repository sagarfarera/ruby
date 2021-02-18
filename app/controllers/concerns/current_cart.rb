module CurrentCart
  #placed in concern so that could be shared by all the controllers
  #it bacically provides us :card_id from session object 
  #in case ki id is not found it will create a card and and store it in the session object
  # implies that we will ensure that cart is setted in the session object

    def set_cart
      @cart = Cart.find(session[ :cart_id])
      rescue ActiveRecord::RecordNotFound
        @cart = Cart.create
        session[:cart_id] = @cart.id
      end
    end
 