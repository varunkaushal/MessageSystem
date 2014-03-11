class User < ActiveRecord::Base

  has_secure_password
  has_many :messages, through: :inbox
  has_many :messages, through: :outbox
  has_many :groups, through: :groupmemeber

end
