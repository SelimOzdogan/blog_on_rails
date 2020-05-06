class UsersController < ApplicationController
  before_action :find_user, only: [:edit, :update, :editpassword]

  def new
    @user = User.new
  end

  def create
    @user = User.new user_params
    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = "Thank you for Signing in!"
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @user.update user_params
      redirect_to posts_path
    else
      render :edit
    end
  end

  def editpassword
  end

  def updatepassword
    @password = params.require(:user)[:current_password]
     byebug
    if password_correct? @password
      if @current_user.update user_params
        flash[:notice] = "Password Changed"
        redirect_to posts_path
      else
        redirect_to editpassword_path
      end
    else
      flash[:alert] = "Wrong Password"
      redirect_to editpassword_path
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

  def find_user
    @user = User.find params[:id]
  end
end
