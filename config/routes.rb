Rails.application.routes.draw do
  root 'questions#index'

  match 'questions/next/:last_q', to: 'questions#next', via: :get

  resources :questions do
    resources :answers, only: [:create, :update]
  end



  match 'auth/:provider/callback', to: 'sessions#create', via: [:get, :post]
  match 'auth/failure', to: redirect('/'), via: [:get, :post]
  match 'signout', to: 'sessions#destroy', as: 'signout', via: [:get, :post]
end
