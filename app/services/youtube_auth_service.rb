# frozen_string_literal: true

class YoutubeAuthService
  attr_reader :authorization_code, :domain

  def initialize(authorization_code, domain)
    @authorization_code = authorization_code
    @domain = domain
  end

  def auth
    Yt::Account.new(authorization_code:, redirect_uri:)
  end

  def redirect_uri
    "#{domain}/callback"
  end
end
