class QuizzPolicy < ApplicationPolicy
	attr_reader :user, :quizz

	def initializer 
		@user = user 
		@quizz = quizz
	end 

	def show?
		user.admin? 
	end 

	def new?
		user && user.admin?
	end 

	def create? 
		user.admin? 
	end

	def update? 
		user && user.admin?  
	end

	def destroy? 
		user.admin?
	end 
	
end 