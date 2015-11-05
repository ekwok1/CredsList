Rails.application.routes.draw do

#password reset
resources :password_resets, only: [:new, :edit, :create, :update]

#for omniauth
match "/auth/:provider/callback" => 'sessions#create'
match "/signout" => "session#destroy", :as => :signout

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

end
