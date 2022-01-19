Rails.application.routes.draw do
  devise_for :users
    devise_scope :user do
      get '/users/sign_out' => 'devise/sessions#destroy'
    end

  resources :users
  
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
 
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
