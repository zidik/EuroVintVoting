Rails.application.routes.draw do
  get "/auth/auth0/callback" => "auth0#callback"
  get "/auth/failure" => "auth0#failure"
  get "/auth/login" => "auth0#login"

  get 'results/show'

  root 'dashboard#index'
  get 'dashboard/index'

  resources :votes
  resources :participants
  resources :registrations

  resources :votings do
    member do
      post 'start'
      post 'stop'
    end
  end

  post 'votefor/:choice', to: 'votes#receive_vote'


end
