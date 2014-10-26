Rails.application.routes.draw do

  get 'account_activations/edit'

  get 'sessions/new'

  get 'users/new'

  root 'sessions#new'


  get 'signup' => 'users#new'

  get    'login'   => 'sessions#new'
  post   'login'   => 'sessions#create'
  delete 'logout'  => 'sessions#destroy'

  resources :users
  resources :account_activations, only: [:edit]

end
