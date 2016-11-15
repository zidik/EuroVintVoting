class Auth0Controller < ApplicationController
  def callback
    # This stores all the user information that came from Auth0
    # and the IdP
    session[:userinfo] = request.env['omniauth.auth'].except('extra')

    # Redirect to the URL you want after successful auth
    redirect_to '/'
  end

  def failure
    # show a failure page or redirect to an error page
    @error_msg = request.params['message']
  end

  def login

  end
  def logout
    session.clear
    redirect_to "/"
    #redirect_to "https://#{ENV['AUTH0_DOMAIN']}/v2/logout?returnTo="+CGI.escape(request.base_url)
  end
end
