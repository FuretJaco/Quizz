class QuizzesController < ApplicationController
 	
 	def index 
		@quizz = Quizz.all
	end 

	def new
	end 

	def create 
	end 

	def edit 
	end 

	def update
	end 

	def detroy 
	end 


	private 
	def quizz_params
		params.require(:quizz).permit(:title, question_attributes: [:id, :title, :content], options_attributes: [:id, :label, :value])
	end 
end
