# frozen_string_literal: true

class LikesController < ApplicationController
  def new
    @videos = video_list_file['videos']
  end

  def create
    LikerService.new(video_ids, auth).like_all

    redirect_to likes_path, flash: { success: 'All videos successfully liked!' }
  end

  private

  def auth
    @auth ||= Yt::Account.new(authorization_code: session[:authorization_code], redirect_uri:)
  end

  def video_ids
    video_list_file['videos'].pluck('id')
  end

  def video_list_file
    YAML.load_file('config/videos.yml')
  end

  def redirect_uri
    "#{request.base_url}/callback"
  end
end
