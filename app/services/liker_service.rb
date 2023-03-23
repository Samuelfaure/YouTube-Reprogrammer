# frozen_string_literal: true

class LikerService
  attr_reader :video_ids, :auth

  def initialize(video_ids, auth)
    @video_ids = video_ids
    @auth = auth
  end

  def like_all
    videos.each(&:like)
  end

  private

  def videos
    video_ids.map { |id| Yt::Video.new id:, auth: }
  end
end
