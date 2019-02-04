Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'users#welcome'

  resources :users, only: [:new, :show, :create, :edit, :update] do
    resources :meals, :foods
  end

  resources :sessions, only: [:new, :create, :destroy]

end
