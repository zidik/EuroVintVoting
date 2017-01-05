class SecuredController < ApplicationController

  before_action :login_filter unless Rails.env.test?
  before_action :set_user_session

  private

  def login_filter
    return redirect_to "/auth/login" unless  session[:userinfo].present?

    allowed_uids = [
        'facebook|1421443111222355',
        'google-oauth2|112064386200264766490'
    ]
    uid = session[:userinfo]["uid"]
    head(:forbidden) unless allowed_uids.include?(uid)
  end

  def set_user_session
    @user_session = session[:userinfo]
  end

end