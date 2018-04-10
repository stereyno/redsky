Rails.application.routes.draw do
  devise_for :users
  resources :items
  root 'static_pages#home'


  get '/store', to:'items#index'
  get '/about', to:'static_pages#about'
  get '/contact', to:'static_pages#contact'
  
  get '/login', to: 'user#login'
  get '/logout', to: 'user#logout'
  
  get 'cart/index'
  get '/cart', to: 'cart#index'
  
  get '/cart/clear', to: 'cart#clearCart'
  get '/cart/:id', to: 'cart#add'
  get '/cart/remove/:id', to: 'cart#remove'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
