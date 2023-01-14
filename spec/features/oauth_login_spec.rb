# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'OAuth login' do
  before { visit login_path }

  let(:login_href) { Yt::Account.new(scopes:, redirect_uri:).authentication_url }
  let(:scopes) { ['youtube'] }
  let(:redirect_uri) { 'http://www.example.com/callback' }

  it 'has a link to login with Google' do
    expect(page).to have_link('login', href: login_href)
  end
end
