class User < ApplicationRecord
  rolify
	has_secure_password
	
#	has_and_belongs_to_many :roles, :join_table => :users_roles

  after_create :assign_default_role

  def assign_default_role
    self.add_role(:crew) if self.roles.blank?
  end
end
