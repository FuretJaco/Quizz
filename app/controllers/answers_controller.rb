class AnswersController < ApplicationController	
	
	def new
		fetch_participation
		fetch_question
		@answer = @participation.answers.build
	end 

	def create
		fetch_participation
		@answer = @participation.answers.build(answer_params)
		if @answer.save 
			if @participation.unanswered_questions.empty?
				flash[:notice] = "Nice, you've completed the quizz"
				redirect_to root_path
			else 
				next_question = @participation.unanswered_questions.first
				redirect_to new_participation_question_answer_path(participation_id: @participation, question_id: next_question)
			end 
		else
			@question = Question.find(params[:question_id])
			render "new"
		end
	end


	private 


	def answer_params
		params.require(:answer).permit(:option_id).merge({participation_id: params[:participation_id]})
	end 

	def fetch_participation
		@participation =  ParticipationDecorator.decorate Participation.find(params[:participation_id])
	end 

	def fetch_question
		@question = Question.find(params[:question_id])
	end 

end
