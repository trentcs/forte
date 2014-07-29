class UsersController < ApplicationController
  skip_before_action :require_login, only: [:new, :create, :edi, :update]

  def new
    @user = User.new
  end

  def create
    @user = sign_up(user_params)
    
    if @user.valid?
      sign_in(@user)
      render json: {redirect: user_path(@user)}
    else
      render json: {errors: @user.errors.full_messages}, status: 422
    end
  end

  def show
    require_login
    @user = User.find(current_user.id)
  end

  def edit
    require_login

    @user = User.find(current_user.id)
  end

  def update
    require_login
    @user = User.find(params[:id])
    @user.update(user_params)
    @errors = []

    if @user.valid?
      redirect_to user_path(@user)
    else
      render json: {errors: @user.errors.full_messages}, status: 422
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :user_image_url)
  end

  def session_params
     params.require(:session).permit(:email_or_username, :password)
  end

end

