class UsersController < ApplicationController
  skip_before_action :require_login, only: [:new, :create]

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
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    @errors = []
    if @user.valid?
      render json: {redirect: user_path(@user)}
    else
      render json: {errors: @user.errors.full_messages}, status: 422
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :user_image_url)
  end
end

