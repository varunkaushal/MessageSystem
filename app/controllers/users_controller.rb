class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    if session[:user_id] != @user.id
      redirect_to root_url, notice: "Unauthorized1"
    end
  end

  def create
    user = User.new
    user.user_name = params[:user_name]
	user.first_name = params[:first_name]
	user.last_name = params[:last_name]
    user.email = params[:email]
    user.password = params[:password]
	user.password_confirmation = params[:password]
    user.save
	puts user.errors.inspect
    session[:user_id] = user.id
    redirect_to root_url, notice: "Thanks for signing up!"
  end
end
