Rails.application.routes.draw do
  get 'orderitems/index'

  get 'orderitems/show'

  get 'orderitems/new'

  get 'orderitems/edit'

  resources :orders do
    resources:orderitems
  end
  resources :categories
  devise_for :users do 
    resources:orders
  end
  
  get '/checkout' , to: 'cart#createOrder'
  
  get '/paid', to: 'static_pages#paid'
  
  

  
  post '/search', to: 'items#search'
 
  
  resources :items
  root 'static_pages#home'


  get '/store', to:'items#index'
  get '/about', to:'static_pages#about'
  get '/contact', to:'static_pages#contact'
  
  
 
  get 'cart/index'
  get '/cart', to: 'cart#index'
  
  get '/cart/clear', to: 'cart#clearCart'
  get '/cart/:id', to: 'cart#add'
  get '/cart/remove/:id', to: 'cart#remove'
  
  get 'category/:title', to: 'static_pages#category'
  
  resources:users
  get '/editprofile', to: 'static_pages#editprofile'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
