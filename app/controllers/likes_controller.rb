# frozen_string_literal: true

class LikesController
  def create
    LikerService.new(account, videos).like_all

    redirect_to root_path, flash: 'Success !'
  end

  private

  def account
    Yt::Account.new(authorization_code:, redirect_uri:)
  end

  def authorization_code
    session[:user_code]
  end

  def videos
    YAML.load_file('config/videos.yml')
  end
end
