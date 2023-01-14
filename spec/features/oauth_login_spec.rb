# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'OAuth login', type: :feature do
  before do
    visit '/'
  end

  let(:login_href) { Yt::Account.new(scopes:, redirect_uri:).authentication_url }
  let(:scopes) { ['youtube'] }
  let(:redirect_uri) { 'https://www.example.com:80/callback' }

  it 'has a link to login with Google' do
    expect(page).to have_link('Login', href: login_href)
  end
end
