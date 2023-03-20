# frozen_string_literal: true

require 'rails_helper'

RSpec.describe LikerService do
  subject(:call) { described_class.new(video_ids, authorization_code).like_all }

  let(:id) { 'video-id' }
  let(:video_ids) { [id] }
  let(:authorization_code) { 'auth-code' }

  let(:rating) { instance_double(Yt::Rating) }
  let(:video) { instance_double(Yt::Video) }
  let(:auth) { instance_double(Yt::Account).as_null_object }

  before do
    allow(Yt::Account).to receive(:new).with({ authorization_code: }).and_return(auth)
    allow(Yt::Video).to receive(:new).with({ id:, auth: }).and_return(video)
  end

  it 'likes videos from the list' do
    expect(video).to receive(:like)

    call
  end
end
