Rails.application.routes.draw do
  resources :line_items
  resources :carts
  get 'store/index'
  resources :products
  root 'store#index'
  get 'home/index'
  get 'home/aboutus'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
