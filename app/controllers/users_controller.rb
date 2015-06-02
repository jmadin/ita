class UsersController < ApplicationController
  before_action :signed_in_user, only: [:show, :index, :edit, :update]
  before_action :correct_user,   only: [:edit, :update]
  before_action :admin_user,     only: [:new, :create, :destroy]

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    
    if @user.save
      if not current_user.admin?
        sign_in @user
      end
      flash[:success] = "Welcome to Ita"
      if current_user.admin?
        redirect_to users_path
      else
        redirect_to @user
      end
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @user.update_attributes(user_params)
      flash[:success] = "Profile updated"
      redirect_to @user
    else
      render 'edit'
    end
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:warning] = "User destroyed."
    redirect_to users_url
  end


  private

    def user_params
      params.require(:user).permit(:name, :surname, :institution, :email, :password, :password_confirmation)
    end

    # Before filters
  end
