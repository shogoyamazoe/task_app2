Rails.application.routes.draw do
  get 'rooms/index'
  get '/' => 'tops#index'
  devise_for :users
  root 'tops#index'
  get 'tops/show'
  resources :rooms
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
