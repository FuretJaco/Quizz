class AnswerPolicy < ApplicationPolicy
	attr_reader :user, :answer 

	def initialize(user, answer)
		@user = user
		@answer = answer 
	end 

end 