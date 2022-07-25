Rails.application.routes.draw do
  devise_for :users
  scope '/admin' do
    resources :users
  end
  resources :likes
  resources :products
  resources :stores
  resources :users
  resources :roles


  root to: 'stores#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
