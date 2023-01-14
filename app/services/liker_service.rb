# frozen_string_literal: true

class LikerService
  def initialize(account, videos)
    @account = account
    @videos = videos
  end

  def like_all
    @videos.each { |video| like(video) }
  end

  private

  def like(video); end
end
