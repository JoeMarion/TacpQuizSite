Rails.application.routes.draw do
  get 'password_resets/new'

  get 'password_resets/edit'

  get 'password_resets/new'

  get 'password_resets/edit--no-test-framework'

  get 'account_activations/edit'

  get 'sessions/new'

  root to: 'forums#index'

  get    'signup' => 'users#new'
  get    'login'  => 'sessions#new'
  post   'login'  => 'sessions#create'
  delete 'logout' => 'sessions#destroy'

  resources :users
  resources :account_activations, only: [:edit]
  resources :password_resets, only: [:new, :create, :edit, :update]

  resources :forums, only: [:index] do
    resources :topics
  end
end
