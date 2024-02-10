# frozen_string_literal: true

class ApplicationController < ActionController::API
  after_action :set_jwt_token

  private

  def current_account
    rodauth.rails_account
  end

  def authenticate!
    # setting this until I add basic authentication for testing purposes
    return true if Rails.env.test?

    rodauth.check_active_session && rodauth.require_account && rodauth.valid_jwt?
  end

  def set_jwt_token
    return unless rodauth.use_jwt? && rodauth.valid_jwt?

    response.headers['Authorization'] = rodauth.session_jwt
  end
end
