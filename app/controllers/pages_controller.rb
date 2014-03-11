  class PagesController < ApplicationController

    before_action :require_login, :except => [:home, :login]
    before_action :identify_user

    def identify_user
      user = User.find_by(id: session[:user_id])
      if user
        @username = user.user_name
      end
    end

    def require_login
      if session[:user_id].blank?
        redirect_to root_url, notice: "Please login or create new account"
      end
    end

    def logout
      #session[:username] = nil
      reset_session
      redirect_to root_url
    end

    def login
      session[:id] = params[:name]
      redirect_to root_url
    end
	
	def inbox
	  message_ids = Inbox.find_by(user_id: session[:user_id])
	  @messages = Message.all(:id == message_ids)
	end
	
	def outbox
	  message_ids = Outbox.find_by(user_id: session[:user_id])
	  @messages = Message.all(:id == message_ids)
	end
	
	def view
	  @message = Message.find_by_id(params[:message_id])
	  @user = User.find_by(id: session[:user_id])
	end
	
	def update
	  message = Message.find_by_id(params[:message_id])
	  message.is_read = 'true'
	  message.save
	  redirect_to inbox_url
	end

  end








