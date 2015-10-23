class UsersController < ApplicationController
  def show
  end

  def edit
  end

  def create
  end

  def delete
  end

  def user_params
      params.require(:user).permit(:id, :full_name, :email, :password, :token, :display_name)
  end
end
