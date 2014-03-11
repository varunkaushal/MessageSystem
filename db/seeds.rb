all_message_data = [
					{:sender_name => "user1",
					:recipient_name => "user2",
					:content => "This is the first read message",
					:is_read => "true"
					},
					{:sender_name => "user1",
					:recipient_name => "user3",
					:content => "This is the second read message",
					:is_read => "true"
					},
					{:sender_name => "user1",
					:recipient_name => "user4",
					:content => "This is the first unread message",
					:is_read => "false"
					},
					{:sender_name => "user2",
					:recipient_name => "user3",
					:content => "This is the second unread message",
					:is_read => "false"
					},
					{:sender_name => "user2",
					:recipient_name => "user4",
					:content => "Another message",
					:is_read => "false"
					},
					{:sender_name => "user3",
					:recipient_name => "user4",
					:content => "Dudes!  there are people here",
					:is_read => "true"
					},
					{:sender_name => "user4",
					:recipient_name => "group1",
					:content => "Test test test test",
					:is_read => "true"
					},
					{:sender_name => "user4",
					:recipient_name => "group2",
					:content => "well well well.  we meet again",
					:is_read => "true"
					}
					]
					
all_user_data = [
				 {:user_name => "user1",
				 :first_name => "Frank",
				 :last_name => "User",
				 :email => "frank@user.com",
				 :password => "password1",
				 :password_confirmation => "password1"
				 },
				 {:user_name => "user2",
				 :first_name => "Bill",
				 :last_name => "User",
				 :email => "bill@user.com",
				 :password => "password1",
				 :password_confirmation => "password1"
				 },
				 {:user_name => "user3",
				 :first_name => "Marge",
				 :last_name => "User",
				 :email => "marge@user.com",
				 :password => "password1",
				 :password_confirmation => "password1"
				 },
				 {:user_name => "user4",
				 :first_name => "Anne",
				 :last_name => "User",
				 :email => "anne@user.com",
				 :password => "password1",
				 :password_confirmation => "password1"
				 },
				]
				
all_inbox_data = [
					{:user_id => 2,
					:message_id => 1
					},
					{:user_id => 3,
					:message_id => 2
					},
					{:user_id => 4,
					:message_id => 3
					},
					{:user_id => 3,
					:message_id => 4
					},
					{:user_id => 4,
					:message_id => 5
					},
					{:user_id => 4,
					:message_id => 6
					},
					{:user_id => 1,
					:message_id => 7
					},
					{:user_id => 2,
					:message_id => 7
					},
					{:user_id => 2,
					:message_id => 8
					},
					{:user_id => 3,
					:message_id => 8
					}
				 ]
				 
all_outbox_data = [
					{:user_id => 1,
					:message_id => 1
					},
					{:user_id => 1,
					:message_id => 2
					},
					{:user_id => 1,
					:message_id => 3
					},
					{:user_id => 2,
					:message_id => 4
					},
					{:user_id => 2,
					:message_id => 5
					},
					{:user_id => 3,
					:message_id => 6
					},
					{:user_id => 4,
					:message_id => 7
					},
					{:user_id => 4,
					:message_id => 8
					}
				 ]
				 
all_group_data = [
					{:group_name => "group1"
					},
					{:group_name => "group2"
					}
				 ]
				 
all_groupmember_data = [
						{:group_id => 1,
						:user_id => 1
						},
						{:group_id => 1,
						:user_id => 2
						},
						{:group_id => 2,
						:user_id => 2
						},
						{:group_id => 2,
						:user_id => 3
						}
					   ]
					

Inbox.destroy_all
Outbox.destroy_all
Groupmember.destroy_all
Message.destroy_all
Group.destroy_all
User.destroy_all

all_user_data.each do |user|
  u = User.new
  u.user_name = user[:user_name]
  u.first_name = user[:first_name]
  u.last_name = user[:last_name]
  u.email = user[:email]
  u.password = user[:password]
  u.password_confirmation = user[:password]
  u.save
end

all_message_data.each do |message|
  m = Message.new
  m.sender_name = message[:sender_name]
  m.recipient_name = message[:recipient_name]
  m.content = message[:content]
  m.is_read = message[:is_read]
  m.save
end

all_inbox_data.each do |inbox|
  i = Inbox.new
  i.user_id = inbox[:user_id]
  i.message_id = inbox[:message_id]
  i.save
end

all_outbox_data.each do |outbox|
  o = Outbox.new
  o.user_id = outbox[:user_id]
  o.message_id = outbox[:message_id]
  o.save
end

all_group_data.each do |group|
  g = Group.new
  g.group_name = group[:group_name]
  g.save
end

all_groupmember_data.each do |groupm|
  g = Groupmember.new
  g.group_id = groupm[:group_id]
  g.user_id = groupm[:user_id]
  g.save
end