Rails.application.routes.draw do
  
  

  resources :wishlists
  resources :categories
  resources :orders do 
    resources:orderitems
  end

  devise_for :users do
    resources :orders 
  end
  get 'cart/index'
  get 'wishlist/index'
  resources :items
  root :to => 'static_pages#home'

  get '/help' => 'static_pages#help'

  get '/about' => 'static_pages#about'
  
  get '/login' => 'user#login'
  
  get '/logout' => 'user#logout'
  
  get '/cart', to: 'cart#index'
  get '/cart/:id', to: 'cart#add'
  get '/cart/remove/:id' => 'cart#remove'  
  get '/clearcart', to: 'cart#clearCart'
  get '/cart/decrease/:id' => 'cart#decrease'
  get '/cart/increase/:id' => 'cart#increase'  
  
  get '/wishlist', to: 'wishlist#index'
  get '/wishlist/:id', to: 'wishlist#addToWish'
  get '/wishlist/remove/:id' => 'wishlist#remove'

  get '/checkout' => 'cart#createOrder'
  
  get '/paid/:id' => 'static_pages#paid'
  
  get '/users' => 'static_pages#users'
  
  get '/upgrade/:id' => 'static_pages#upgrade'
  
  get '/downgrade/:id' => 'static_pages#downgrade'
  
  get '/delete/:id' => 'orders#delete'
  
  post '/search' => 'items#search'
  
  get '/search' => 'static_pages#searchproducts'
  
  get 'category/:title', to: 'static_pages#category'
  
  get '/bag/:id', to: 'cart#bag'
  
  get '/fender' => 'static_pages#fender'
  get '/gibson' => 'static_pages#gibson'
  get '/taylor' => 'static_pages#taylor'
  get '/martin' => 'static_pages#martin'
  get '/takamine' => 'static_pages#takamine'
  get '/yahama' => 'static_pages#yahama'
  

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
