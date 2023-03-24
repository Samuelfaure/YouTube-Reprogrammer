Rails.application.routes.draw do
  root to: 'login#new', as: :login

  delete '/', to: 'login#destroy'

  # Callback after oauth
  get '/callback', to: 'login#create'

  get '/likes', to: 'likes#new'
  post '/likes', to: 'likes#create'
  delete '/likes', to: 'likes#destroy'
end
