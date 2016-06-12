Rails.application.routes.draw do
  get 'quizzes/index'

  get 'quizzes/create'

  get 'password_resets/new'

  get 'password_resets/edit'

  get 'password_resets/new'

  get 'password_resets/edit--no-test-framework'

  get 'account_activations/edit'

  get 'sessions/new'

  root to: 'static_pages#home'

  get    'signup' => 'users#new'
  get    'login'  => 'sessions#new'
  post   'login'  => 'sessions#create'
  delete 'logout' => 'sessions#destroy'

  resources :users
  resources :scores do
    resources :quizzes
  end
  resources :account_activations, only: [:edit]
  resources :password_resets, only: [:new, :create, :edit, :update]

end
