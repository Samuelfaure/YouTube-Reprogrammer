class LikerService
  def initialize(user, videos = all_videos)
    @user = user
    @videos = videos
  end

  def like_videos
    @videos.each { |video| like(video) }
  end

  private

  def like(video); end

  def all_videos
    YAML.load_file('config/videos.yml')
  end
end
