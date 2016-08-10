class QuestionsController < ApplicationController
	before_action :get_question, only: [:edit, :update, :destroy]
	
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
		@oneQuestion = Question.find(params[:id])
		@options = @oneQuestion.options
	end
	
	def new
		if current_user.admin? 
			@question = Question.new
			3.times do 
				@question.options.build
			end 
		else  
			redirect_to questions_path, :alert => "You can't post a question"
		end
	end

	def create
		if current_user.admin?
			@question = Question.create!(question_params)
			redirect_to question_path(@question), :notice => t(:submit_flash)
		else
			redirect_to questions_path, :alert => "You can't do it"
		end 
		
	end 

	def edit 
	end 

	def update
		if current_user.admin? 
			@question.update_attributes(question_params)
			3.times do 
				@question.options.update_attributes
			end
			redirect_to questions_path(@question) 
		else
			redirect_to questions_path, :alert =>  "You can't do it"
		end 
	end 

	def destroy
		if current_user.admin? 
			@question.destroy
			redirect_to questions_path, :notice => "Quizz is correctly deleted"
		else 
			redirect_to questions_path, :alert => "You can't do it"
		end
	end 

	private 
		def question_params
			params.require(:question).permit(:title, :body, :image,
				options_attributes: [:id, :label, :value, :_destroy])
		end
end
