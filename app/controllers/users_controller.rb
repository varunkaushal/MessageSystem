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
	
	if user.valid?
		user.save
		session[:user_id] = user.id
		redirect_to root_url, notice: "Thanks for signing up!"
	else
		@errors = user.errors.full_messages.to_sentence
		redirect_to '/users/new', notice: @errors
    end
  end
  
  def sendM
	getter = User.find_by(user_name: params["recipient"])
       
	   if getter
		   m = Message.new
		   m.recipient_name = params["recipient"]
		   m.content = params["content"]
		   
		   user = User.find_by(id: session[:user_id])
		   m.sender_name = user.user_name
		   m.is_read = 'false'
		   m.save
		   
		   i = Inbox.new
		   i.user_id = getter.id
		   i.message_id = m.id
		   i.save
		   
		   o = Outbox.new
		   o.user_id = user.id
		   o.message_id = m.id
		   o.save
		   
	   else
	       redirect_to message_url, notice: "recipient does not exist"
		   return
	   end
	   
	   redirect_to inbox_url
  end
end
