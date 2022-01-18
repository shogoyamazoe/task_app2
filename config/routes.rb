Rails.application.routes.draw do
  devise_for :users
  root to:'tops#index'
 
 
  resources :rooms do
    collection do
      get :search
      get :postuser
    end
  end

  resources :reservations , only: [:index, :new, :create, :show] do
    collection do
      post :confirm
    end
  end
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
