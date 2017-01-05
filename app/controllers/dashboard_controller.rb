class DashboardController < SecuredController
  skip_before_action :login_filter, :only => [:index] unless Rails.env.test?
  def index
  end
end
