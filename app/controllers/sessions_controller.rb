class SessionsController < ApplicationController

  def destroy
    reset_session
    redirect_to root_url, notice: "Thank you, come again!"
  end

  def create
    user_n = params[:user_name]

    user = User.find_by(user_name: user_n)
    if user
      if user.authenticate(params[:password])
        session[:user_id] = user.id
        redirect_to root_url, notice: "Welcome Back, #{user.user_name}"
      else
        redirect_to root_url, notice: "Bad Password"
      end
    else
       redirect_to root_url, notice: "Unknown Username"
    end
  end

end
