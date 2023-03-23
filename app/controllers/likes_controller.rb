# frozen_string_literal: true

class LikesController < ApplicationController
  def new
    @videos = video_list
  end

  def create
    failed_videos = LikerService.new(video_list, auth).like_all_and_return_failed

    flash_msgs = { success: 'Videos successfully liked!' }
    flash_msgs.merge!(warning: "Failed to like videos: #{failed_videos.join(', ')}") if failed_videos.any?

    redirect_to login_path, flash: flash_msgs
  end

  private

  def auth
    @auth ||= Yt::Account.new(authorization_code: session[:authorization_code], redirect_uri:)
  end

  def video_list
    YAML.load_file('config/videos.yml')['videos']
  end

  def redirect_uri
    "#{request.base_url}/callback"
  end
end
