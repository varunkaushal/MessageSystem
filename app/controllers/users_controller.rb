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
		   getter = Group.find_by(group_name: params["recipient"])
		   
		   if getter
			   m = Message.new
			   m.recipient_name = params["recipient"]
			   m.content = params["content"]
			   
			   user = User.find_by(id: session[:user_id])
			   m.sender_name = user.user_name
			   m.is_read = 'false'
			   m.save
			   
			   o = Outbox.new
			   o.user_id = user.id
			   o.message_id = m.id
			   o.save
			   
			   members = Groupmember.where(:group_id => getter.id).pluck(:user_id)
			   for x in members
				   i = Inbox.new
				   i.user_id = x
				   i.message_id = m.id
				   i.save	
			   end
		   else
			   redirect_to message_url, notice: "recipient does not exist"
			   return
		   end
	   end
	   
	   redirect_to inbox_url
  end
  
  def joinGroup
		group = Group.find_by(group_name: params["group_name"])
		if group
			groupmember = Groupmember.where(:group_id => group.id, :user_id => session[:user_id])
			if groupmember
				redirect_to user_url(session[:user_id]), notice: "Already a member"
				return
			else
				gm = Groupmember.new
				gm.group_id = group.id
				gm.user_id = session[:user_id]
				gm.save
			end
		else
			if params["group_name"].empty?
				redirect_to user_url(session[:user_id]), notice: "Enter a valid group name"
				return
			end
			g = Group.new
			g.group_name = params["group_name"]
			
			if g.valid?
				g.save
				gm = Groupmember.new
				gm.group_id = g.id
				gm.user_id = session[:user_id]
				gm.save
			else
				@errors = g.errors.full_messages.to_sentence
				redirect_to user_url(session[:user_id]), notice: @errors
				return
			end
			
		end
	redirect_to inbox_url
  end
  

end
