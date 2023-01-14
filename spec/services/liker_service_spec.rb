# frozen_string_literal: true

require 'rails_helper'

RSpec.describe LikerService do
  subject { described_class.new(user, videos) }

  let(:videos) { ['video-id'] }

  it 'likes videos from the list'
end
