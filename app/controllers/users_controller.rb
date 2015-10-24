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
      if u.token == params[:token]
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
     @user = User.new(user_params)
     @user.token = SecureRandom.hex
     if @user.save
       render @user
     else
       render json: {error: ""}
     end
   end

  # DELETE /users/1
  def destroy
    u = User.where(id: params[:id]).first
    if u
      if u.token == params[:token]
        User.find(params[:id]).destroy
      else
        render json: {error: 'Invalid token'}, status: :unauthorized
      end
    else
      render json: {error: 'Invalid User' }, status: :notfound
    end
  end

  def user_params
    params.permit(:id, :full_name, :email, :password, :token, :display_name)
  end
end
