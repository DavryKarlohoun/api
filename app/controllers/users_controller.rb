class UsersController < ApplicationController

  # POST /users
  def create
    u = User.new(user_params)

    if u.save
      render u
    elsif u.errors
      render json: {error: {code: 400, server_message: u.errors}}, status: :bad_request
    else
      render json: {error: {code: 500, message: "Could not save user", server_message: u.errors}}, status: :internal_server_error
    end
  end


  def show
    u = User.where(id: params[:id]).first
    if u
      if u.token == request.headers["user-token"]
        render u
      else
        render json: { error: {code: 403, message: 'Invalid token' }}, status: :forbidden
      end
    else
      render json: { error: {code: 404, message: 'Invalid user' }}, status: :not_found
    end
  end

  def update
    u = User.where(id: params[:id]).first
    if u
      if u.token == request.headers["user-token"]
        u.update(user_params)
        render u
      else
        render json: { error: {code: 403, message: 'Invalid token' }}, status: :forbidden
      end
    else
      render json: { error: {code: 404, message: 'Invalid user' }}, status: :not_found
    end
  end



  # DELETE /users/1
  def destroy
    u = User.where(id: params[:id]).first
    if u
      if u.token == request.headers["user-token"]
        User.find(params[:id]).destroy
      else
        render json: {error: {code: 403, message: 'Invalid token'}}, status: :forbidden
      end
    else
      render json: {error: {code: 404, message: 'Could not find user' }}, status: :not_found
    end
  end

  def user_params
    params.permit(:id, :full_name, :email, :password, :user_token, :display_name)
  end
end
