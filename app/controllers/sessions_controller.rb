class SessionsController < ApplicationController

  def create
    u = User.where(email: params[:email]).first
    if u && u.authenticate(params[:password])
      begin
        u.token = SecureRandom.hex
      end while u.class.exists?(token: u.token)
      u.save
      @current_user = u
      render u
    else
      render json: { error: 'Invalid username or password' }, status: :unauthorized
    end
  end

  def destroy
    u = User.where(token: request.headers["user-token"]).first
    if u
      u.token = nil
      u.save
      @current_user = nil
    else
      render json: { error: 'Invalid token' }, status: :notfound
    end
  end

end
