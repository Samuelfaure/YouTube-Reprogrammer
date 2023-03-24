# frozen_string_literal: true

class LikesController < ApplicationController
  def new
    @videos = video_list.map do |video|
      {
        link: "https://www.youtube.com/watch?v=#{video['id']}",
        title: video['name']
      }
    end
  end

  def create
    failed_videos = LikerService.new(video_list, auth).like_all_and_return_failed

    flash_msgs = { success: 'Videos successfully liked!' }
    add_failed_videos_warning(flash_msgs, failed_videos) if failed_videos.any?

    redirect_to login_path, flash: flash_msgs
  end

  def destroy
    failed_videos = LikerService.new(video_list, auth).unlike_all_and_return_failed

    flash_msgs = { success: 'Videos successfully unliked!' }
    add_failed_videos_warning(flash_msgs, failed_videos) if failed_videos.any?

    redirect_to login_path, flash: flash_msgs
  end

  private

  def auth
    @auth ||= YoutubeAuthService.new(session[:authorization_code], request.base_url).auth
  end

  def video_list
    YAML.load_file('config/videos.yml')['videos']
  end

  def add_failed_videos_warning(flash_msgs, failed_videos)
    flash_msgs.merge!(warning: "Operation failed on videos: #{failed_videos.join(', ')} (Already liked/unliked?)")
  end
end
