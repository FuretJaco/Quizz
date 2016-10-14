class QuizzesController < ApplicationController
	before_action :get_quizz, only: [:show, :edit, :update, :destroy]
	after_action :verify_authorized, except: [:index] 

	def get_quizz
		@quizz = Quizz.find(params[:id])
	end 
 	
 	def index 
		@quizz = Quizz.all
	end 

	def show
		authorize @quizz
	end 

	def new
		@quizz = Quizz.new
		authorize @quizz
	end 

	def create 
		@quizz = Quizz.create!(quizz_params)
		authorize @quizz
		redirect_to quizz_path(@quizz), :notice => t(:submit_flash)
	end 

	def edit 
		authorize @quizz
	end 

	def update
		@quizz.update_attributes(quizz_params)
		authorize @quizz
		redirect_to quizzes_path(@quizz)
	end 

	def detroy 
		@quizz.destroy
		authorize @quizz
		redirect_to quizzes_path, :notice => "Quizz is correctly deleted"
	end 


	private 
	def quizz_params
		params.require(:quizz).permit(:title, questions_attributes: [:id, :title, :content, options_attributes: [:id, :value, :content]])
	end 
end
