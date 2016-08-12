class UserPolicy < ApplicationPolicy
	 
	 def initialize (current_user, model)
	 	@current_user = current_user
	 	@user = model
	 end 
	 
end 