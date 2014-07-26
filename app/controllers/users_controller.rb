class UsersController < ApplicationController
  skip_before_action :require_login, only: [:new, :create]
  before_create :set_default_image

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

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :user_image_url)
  end
end

