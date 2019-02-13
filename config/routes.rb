Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'sessions#new', as: 'login'

  resources :users, only: [:new, :show, :create, :edit, :update]

  resources :meals do
    resources :foods, only: [:new, :index, :create]
  end

  resources :foods, only: [:show, :edit, :update, :destroy]

  resources :sessions, only: [:new, :create, :destroy] do
    collection do
      get 'welcome'
    end
  end

  get '/auth/facebook/callback' => 'sessions#create'

end
