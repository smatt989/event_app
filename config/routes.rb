Rails.application.routes.draw do

  get 'password_reset/new'

  get 'password_reset/edit'

  get 'account_activations/edit'

  get 'sessions/new'

  get 'users/new'

  root 'sessions#new'


  get 'signup' => 'users#new'

  get    'login'   => 'sessions#new'
  post   'login'   => 'sessions#create'
  delete 'logout'  => 'sessions#destroy'
  resources :users do
    member do
      get :following, :followers, :createdEvents, :followingEvents
    end
  end

  resources :account_activations, only: [:edit]
  resources :password_resets, only: [:new, :create, :edit, :update]
  resources :events do
    member do
      get :sharers
    end
  end
  resources :following_relationships, only: [:create, :destroy]

end
