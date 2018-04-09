Rails.application.routes.draw do
  resources :items
  root 'static_pages#home'


  get '/store', to:'items#index'
  get '/about', to:'static_pages#about'
  get '/contact', to:'static_pages#contact'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
