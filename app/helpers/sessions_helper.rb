module SessionsHelper
  def current_user
    @current_user ||= User.find_by(email: params[:email])
    if @current_user && @current_user.authenticate(params[:password])
      # do something
    else
      # return an error
    end
  end
end
