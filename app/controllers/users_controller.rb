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
    if !can?(:update, @user)
      redirect_to root_path
    end
  end

  def update
    if !can?(:update, @user)
      flash[:warning] = "You can't update an user you don't own"
      redirect_to root_path
    else
      if @user.update user_params
        redirect_to posts_path
      else
        render :edit
      end
    end
  end

  def editpassword
    if !can?(:update, @user)
      redirect_to root_path
    end
  end

  def updatepassword
    if !can?(:update, @user)
      redirect_to root_path
    else
      @password = params.require(:user)[:current_password]
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
  end

  def users_info
    @users = User.all.order(id: :asc)
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

  def find_user
    @user = User.find params[:id]
  end
end
