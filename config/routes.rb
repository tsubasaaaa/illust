Rails.application.routes.draw do
  devise_for :users do get '/users/sign_out' => 'devise/sessions#destroy' 
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "illustrations#index"

  resources :illustrations do
    resources :comments, only: [:create]
    collection do
      get 'search'
      get 'search_list'
    end
  end
  resources :users, only: [:show]
end
