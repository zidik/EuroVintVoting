class DashboardController < SecuredController
  skip_before_action :logged_in_using_omniauth?, :only => [:index] unless Rails.env.test?
  def index
  end
end
