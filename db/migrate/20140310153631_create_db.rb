class CreateDb < ActiveRecord::Migration
  def change
    create_table :users do |t|
	  t.string :user_name
      t.string :first_name
      t.string :last_name
	  t.string :email
	  t.string :password_digest

      t.timestamps
    end
	
	create_table :messages do |t|
	  t.string :sender_name
      t.string :recipient_name
      t.string :content
	  t.string :is_read
	  
      t.timestamps
    end
	
	create_table :inboxes do |t|
	  t.integer :user_id
      t.integer :message_id
    end
	
	create_table :outboxes do |t|
	  t.integer :user_id
      t.integer :message_id
    end
	
	create_table :groups do |t|
	  t.string :group_name
      
	  t.timestamps
    end
	
	create_table :groupmembers do |t|
	  t.integer :group_id
	  t.integer :user_id
      
	  t.timestamps
    end
	
  end
end
