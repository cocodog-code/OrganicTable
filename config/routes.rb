Rails.application.routes.draw do
  get 'static_pages/about'
  get '/store_registration', to: 'stores#new'
  resources :stores
end
