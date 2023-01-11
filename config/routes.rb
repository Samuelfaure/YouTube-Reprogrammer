# frozen_string_literal: true

Rails.application.routes.draw do
  root 'login#new'

  # Callback after oauth
  get '/callback', to: 'login#create'

  get '/likes', to: 'likes#new'
  post '/likes', to: 'likes#create'
end
