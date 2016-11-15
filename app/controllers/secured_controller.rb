class SecuredController < ApplicationController

  before_action :logged_in_using_omniauth? unless Rails.env.test?

  private

  def logged_in_using_omniauth?
    unless session[:userinfo].present?
      redirect_to "/auth/login"
    end
  end

end