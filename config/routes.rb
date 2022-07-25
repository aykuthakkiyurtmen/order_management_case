Rails.application.routes.draw do
  devise_for :users do
    get "/users/sign_out" => "devise/sessions#destroy", :as => :destroy_user_session
  end
  scope '/admin' do
    resources :users
  end
  resources :likes
  resources :products
  resources :stores
  resources :users
  resources :roles
  post "/login", to: "sessions#login"

  root to: 'stores#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
