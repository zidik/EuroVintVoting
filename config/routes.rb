Rails.application.routes.draw do
  get "/auth/auth0/callback" => "auth0#callback"
  get "/auth/failure" => "auth0#failure"
  get "/auth/login" => "auth0#login"

  get 'results/show'

  root 'dashboard#index'
  get 'dashboard/index'
  post 'votefor/:choice', to: 'votes#receive_vote'

  resources :votes, only: [:index]
  resources :participants

  resources :votings do
    member do
      post 'start'
      post 'stop'
    end
    get :results
    resources :registrations
  end


end
