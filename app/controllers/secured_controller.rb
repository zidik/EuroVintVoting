class SecuredController < ApplicationController

  before_action :logged_in_using_omniauth? unless Rails.env.test?
  before_action :set_user_session

  private

  def logged_in_using_omniauth?
    unless session[:userinfo].present?
      redirect_to "/auth/login"
    end
  end

  def set_user_session
    @user_session = session[:userinfo]
  end

end