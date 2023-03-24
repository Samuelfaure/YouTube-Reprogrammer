# frozen_string_literal: true

class LikerService
  attr_reader :video_list, :auth

  def initialize(video_list, auth)
    @video_list = video_list
    @auth = auth
  end

  def like_all_and_return_failed
    return_failed do |video|
      Yt::Video.new(id: video['id'], auth:).like
    end
  end

  def unlike_all_and_return_failed
    return_failed do |video|
      Yt::Video.new(id: video['id'], auth:).unlike
    end
  end

  private

  def return_failed
    failed_videos = []

    video_list.each do |video|
      yield(video)
    rescue StandardError => e
      Rails.logger.error("Failed to like/unlike video #{video['name']}: #{e.message}")
      failed_videos << video['name']
    end

    failed_videos
  end
end
