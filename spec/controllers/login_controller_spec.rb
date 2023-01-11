# frozen_string_literal: true

require 'rails_helper'

RSpec.describe LoginController, type: :request do
  describe 'create' do
    it 'sets the session' do
      get '/callback', params: { code: 'code' }

      expect(session[:user_code]).to eq('code')
    end
  end
end
