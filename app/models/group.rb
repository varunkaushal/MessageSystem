class Group < ActiveRecord::Base

	has_many :users, through: :groupmemeber
	
	validates :megroup_n, presence: true
  
  after_validation do
	existing = Group.where(:group_name => self.group_name)
	if existing
	  errors.add(:existing, 'Group name used')
      return false
	end
  end
end
