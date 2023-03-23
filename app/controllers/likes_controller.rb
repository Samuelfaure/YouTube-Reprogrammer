# frozen_string_literal: true

class LikesController < ApplicationController
  def new
    @videos = video_list
  end

  def create
    failed_videos = LikerService.new(video_list, auth).like_all_and_return_failed

    flash_msgs = { success: 'Videos successfully liked!' }
    add_failed_videos_warning(flash_msgs, failed_videos) if failed_videos.any?

    redirect_to likes_path, flash: flash_msgs
  end

  private

  def auth
    @auth ||= YoutubeAuthService.new(session[:access_token], request.base_url).auth
  end

  def video_list
    YAML.load_file('config/videos.yml')['videos']
  end

  def add_failed_videos_warning(flash_msgs, failed_videos)
    flash_msgs.merge!(warning: "Failed to like videos: #{failed_videos.join(', ')}")
  end
end
