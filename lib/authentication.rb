module Authentication
  
  def self.included(controller)
    controller.send :helper_method, :current_user, :logged_in?, :redirect_to_target_or_default
    controller.filter_parameter_logging :password
  end
  
  def current_user_session
      return @current_user_session if defined?(@current_user_session)
      @current_user_session = UserSession.find
  end

  def current_user
      return @current_user if defined?(@current_user)
      @current_user = current_user_session && current_user_session.record
  end
  
  def logged_in?
      current_user
  end
  
  def login_required
    unless logged_in?
      flash[:error] = "Se necesita login"
      store_target_location
      redirect_to login_url
    end
  end
  
  def redirect_to_target_or_default(default)
      redirect_to(session[:return_to] || default)
      session[:return_to] = nil
  end
  
  private
  def store_target_location
      session[:return_to] = request.request_uri
  end

end
