class User < ActiveRecord::Base

  has_secure_password
  has_many :messages, through: :inbox
  has_many :messages, through: :outbox
  has_many :groups, through: :groupmemeber

  validates :user_name, presence: true
  validates :email, presence: true
  validates :password_digest, presence: true
  
  after_validation do
	existing = User.where(:user_name => self.user_name)
	if existing
	  errors.add(:existing, 'Username used')
      return false
	end
  end

end
