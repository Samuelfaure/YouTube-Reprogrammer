# frozen_string_literal: true

class LikerService
  attr_reader :video_list, :auth

  def initialize(video_list, auth)
    @video_list = video_list
    @auth = auth
  end

  def like_all_and_return_failed
    failed_videos = []

    video_list.each do |video|
      Yt::Video.new(id: video['id'], auth:).like
    rescue StandardError
      failed_videos << video['name']
    end

    failed_videos
  end
end
