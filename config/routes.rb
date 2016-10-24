Rails.application.routes.draw do
  root 'welcome#index'
  get 'welcome/index'

  resources :votes
  resources :participants
  resources :registrations

  resources :votings do
    member do
      post 'start'
      post 'stop'
    end
  end

  post 'votefor/:choice', to: 'votes#receive'


end
