Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'sessions#welcome'

  resources :users, only: [:new, :show, :create, :edit, :update]

  resources :meals do
    resources :foods
  end 

  resources :sessions, only: [:new, :create, :destroy] do
    collection do
      get 'welcome'
    end
  end

end
