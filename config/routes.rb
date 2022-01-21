Rails.application.routes.draw do

  devise_for :users, controllers: {
    registrations: 'users/registrations',  
    sessions: 'users/sessions'
  }
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

  resources :reservations  do
    collection do
      get :back
    end
  end


 
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
