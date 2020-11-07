Rails.application.routes.draw do
  get 'stores/new'
  get 'static_pages/about'
  resources :stores
end
