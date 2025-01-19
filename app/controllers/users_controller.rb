class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(username: params[:user][:name], email: params[:user][:email], password: params[:user][:password])

    if @user.save
      redirect_to new_user_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def user_params
    # Permit the allowed parameters for the User model
    params.require(:user).permit(:name, :email, :password)
  end
end
