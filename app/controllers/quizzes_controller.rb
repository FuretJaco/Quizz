class QuizzesController < ApplicationController
	before_action :get_quizz, only: [:edit, :update, :destroy]

	def get_quizz
		@quizz = Quizz.find(params[:id])
	end 
 	
 	def index 
		@quizz = Quizz.all
	end 

	def new
		#authorize @quizz
		@quizz = Quizz.new
	end 

	def create 
		authorize @quizz
		if @quizz = Quizz.create!(quizz_params)
			redirect_to quizz_path(@question), :notice => t(:submit_flash)
		else
			redirect_to quizzes_path, :alert => "You can't do it"
		end 
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
