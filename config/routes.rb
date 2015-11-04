Rails.application.routes.draw do
  root 'sessions#home'

  get 'home', to: 'sessions#home'

  get 'signup', to: 'sessions#signup'

  post 'signup', to: 'sessions#new'

  get 'login', to: 'sessions#login'

  post 'login', to: 'sessions#attempt_login'

  delete 'logout', to: 'sessions#logout'

  get 'users/:id/items', to: 'users#index', as: 'items'

  resources :users, only: [:edit, :show] do
    resources :items, except: [:index], shallow: true
  end

end
