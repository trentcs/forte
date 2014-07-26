class SessionsController < ApplicationController
  skip_before_action :require_login, only: [:new, :create]

  def new
  end

  def create
    user = authenticate_session(session_params)
    puts "DATA SENT OVER IS: #{params[:session]}"
    #successful login
    if sign_in(user)
      render json: {redirect: user_path(user)}
    #unsuccessfull login  
    else
      error = "Email or password is incorrect."
      render json: error, status: 422
    end


  end

  def destroy
    sign_out
    redirect_to root_path
  end

  private

  def session_params
    params.require(:session).permit(:email, :password)
  end
end
