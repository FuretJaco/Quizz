class QuizzesController < ApplicationController
	before_action :get_quizz, only: [:show, :create, :edit, :update, :destroy]
	after_action :verify_authorized, except: [:index] 

	def get_quizz
		@quizz = Quizz.find(params[:id])
	end 
 	
 	def index 
		@quizz = Quizz.all
	end 
	def show
	end 

	def new
		@quizz = Quizz.new
		authorize @quizz
		@quizz.questions.build
	end 

	def create 
		authorize @quizz
		@quizz = Quizz.create!(quizz_params)
		redirect_to quizz_path(@quizz), :notice => t(:submit_flash)
	end 

	def edit 
	end 

	def update
		if @quizz.update_attributes(quizz_params)
			redirect_to quizzes_path(@quizz)
		else
			redirect_to quizzes_path, :alert => "You're not authorize for this action"
		end 
	end 

	def detroy 
		@quizz.destroy
		authorize @quizz
		redirect_to quizzes_path, :notice => "Quizz is correctly deleted"
	end 


	private 
	def quizz_params
		params.require(:quizz).permit(:title, question_attributes: [:id, :title, :content], options_attributes: [:id, :value, :content])
	end 
end
