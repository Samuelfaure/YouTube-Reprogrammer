# frozen_string_literal: true

class LikerService
  attr_reader :video_ids, :authorization_code

  def initialize(video_ids, authorization_code)
    @video_ids = video_ids
    @authorization_code = authorization_code
  end

  def like_all
    videos.each(&:like)
  end

  private

  def videos
    video_ids.map { |id| Yt::Video.new id:, auth: account }
  end

  def account
    @account ||= Yt::Account.new(authorization_code:)
  end
end
