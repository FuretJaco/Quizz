class QuestionsController < ApplicationController
	before_action :get_question, only: [:create, :edit, :update, :destroy, :show]
	after_action :verify_authorized, except: [:index] 

	def get_question
		@question = Question.find(params[:id])
	end

	def get_options
		@option = Option.find(params[:option_id])
	end

	def index
		@questions = Question.all
	end

	def show
		authorize @question
		if @oneQuestion = Question.find(params[:id])
			@options = @oneQuestion.options
		else 
			redirect_to root_path 
		end 
	end
	
	def new
		@question = Question.new
		authorize @question
	end

	def create
		@question = Question.create!(question_params)
		authorize @question
		redirect_to question_path(@question), :notice => t(:submit_flash)
	end 

	def edit 
		authorize @question
	end 

	def update
		if @question.update_attributes(question_params)
			redirect_to questions_path(@question) 
		else
			redirect_to questions_path, :alert =>  "You can't do it"
		end 
	end 

	def destroy
		@question.destroy
		authorize @question
		redirect_to questions_path, :notice => "Quizz is correctly deleted"
	end 

	private 
		def question_params
			params.require(:question).permit(:title, :body, :image,
				options_attributes: [:id, :label, :value, :_destroy])
		end
end
