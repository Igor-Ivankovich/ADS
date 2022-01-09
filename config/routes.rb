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
  get 'filter/:tag', to: 'posts#index', as: :ftags
  root to: 'posts#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
