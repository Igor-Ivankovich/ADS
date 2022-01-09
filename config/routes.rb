Rails.application.routes.draw do

  resources :interfaces
  devise_for :users
  scope '/admin' do
    resources :users
    resources :admincas
  end
  resources :posts
  resources :roles
  resources :users
  resources :tags
  root to: 'posts#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
