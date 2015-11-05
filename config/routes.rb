Rails.application.routes.draw do

#password reset
resources :password_resets, only: [:new, :edit, :create, :update]


#for omniauth ???
match '/auth/:provider/callback' => 'sessions#create', via: [:get, :post]
delete '/signout' => 'sessions#destroy', :as => :signout
match '/signin' => 'sessions#new', :as => :signin, via: [:get, :post]

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
