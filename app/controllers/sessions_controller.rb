class SessionsController < ApplicationController

  def create
    u = User.find_by(email: params[:email])
    if u && u.authenticate(params[:password])
      u.token = SecureRandom.hex
      u.save
      @current_user = u
      render u
    else
      render json: { error: 'Invalid username or password' }, status: :unauthorized
    end
  end

  def destroy
    u = User.find_by(token: params[:token])
    u.token = nil
    u.save
    @current_user = nil
  end

end

# 2e9cd1fd7762173e6ecd74fea3b1ea8c
