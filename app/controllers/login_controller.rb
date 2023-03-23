# frozen_string_literal: true

class LoginController < ApplicationController
  def new
    @oauth_url = Yt::Account.new(scopes:, redirect_uri:).authentication_url
  end

  def create
    session[:authorization_code] = params[:code]
    redirect_to likes_path
  end

  private

  def scopes
    ['youtube']
  end

  def redirect_uri
    "#{request.base_url}/callback"
  end
end
