

Rails.application.routes.draw do
  root to: 'login#new', as: :login

  # Callback after oauth
  get '/callback', to: 'login#create'

  get '/likes', to: 'likes#new'
  post '/likes', to: 'likes#create'
end
