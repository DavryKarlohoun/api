class UsersController < ApplicationController

  def show
    u = User.where(id: params[:id]).first
    if u
      render u
    else
      render json: { error: 'Invalid user' }, status: :notfound
    end
  end

  def update
    u = User.where(id: params[:id]).first
    if u
      if u.token == request.headers["user-token"]
        u.update(user_params)
        render u
      else
          render json: { error: 'Invalid token' }, status: :unauthorized
      end
    else
      render json: { error: 'Invalid user' }, status: :notfound
    end
  end

  # POST /users
  def create
    user = User.new(user_params)

    if user.save
      render user
    else
      render json: {error: "Could not save user"}, status: :error
    end
  end

  # DELETE /users/1
  def destroy
    u = User.where(id: params[:id]).first
    if u
      if u.token == request.headers["user-token"]
        User.find(params[:id]).destroy
      else
        render json: {error: 'Invalid token'}, status: :unauthorized
      end
    else
      render json: {error: 'Invalid User' }, status: :notfound
    end
  end

  def user_params
    params.permit(:id, :full_name, :email, :password, :user_token, :display_name)
  end
end
