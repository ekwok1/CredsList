Rails.application.routes.draw do

  #password reset
  resources :password_resets, only: [:new, :edit, :create, :update]

  root 'sessions#home'

  get 'home', to: 'sessions#home'
  get 'signup', to: 'sessions#signup'
  post 'signup', to: 'sessions#new'
  get 'login', to: 'sessions#login'
  post 'login', to: 'sessions#attempt_login'
  delete 'logout', to: 'sessions#logout'

  resources :users, only: [:edit, :show, :update] do
    resources :items, except: [:index], shallow: true
  end

  post 'items/:id', to: 'comments#create', as: 'comments'

end
