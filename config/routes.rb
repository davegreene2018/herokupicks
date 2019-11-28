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

  resources :items
  root :to => 'static_pages#home'

  get '/help' => 'static_pages#help'

  get '/about' => 'static_pages#about'
  
  get '/login' => 'user#login'
  
  get '/logout' => 'user#logout'
  
  get '/cart', to: 'cart#index'
  
  get '/cart/:id', to: 'cart#add'
  
  get '/clearcart', to: 'cart#clearCart'
  
  get '/cart/remove/:id' => 'cart#remove'
  
  get '/cart/decrease/:id' => 'cart#decrease'
  
  get '/cart/increase/:id' => 'cart#increase'
  
  get '/checkout' => 'cart#createOrder'
  
  get '/paid/:id' => 'static_pages#paid'
  
  get '/users' => 'static_pages#users'
  
  get '/upgrade/:id' => 'static_pages#upgrade'
  
  get '/upgrade/:id' => 'static_pages#downgrade'
  
  post '/search' => 'items#search'
  
  get '/search' => 'static_pages#searchproducts'
  
  get 'category/:title', to: 'static_pages#category'
  
  get '/bag/:id', to: 'cart#bag'
  
  get '/fender' => 'static_pages#fender'
  get '/gibson' => 'static_pages#gibson'
  get '/taylor' => 'static_pages#taylor'
  get '/martin' => 'static_pages#martin'
  get '/takamine' => 'static_pages#takamine'
  
  
  
  


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
