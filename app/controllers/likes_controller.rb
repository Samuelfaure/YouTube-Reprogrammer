# frozen_string_literal: true

class LikesController
  def create
    LikerService.new(video_ids, authorization_code).like_all

    redirect_to root_path, flash: 'Success !'
  end

  private

  def authorization_code
    session[:user_code]
  end

  def video_ids
    video_list_file['videos'].pluck('id')
  end

  def video_list_file
    YAML.load_file('config/videos.yml')
  end
end
