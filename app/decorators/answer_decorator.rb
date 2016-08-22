class AnswerDecorator < ApplicationDecorator
	decorates :answer

	def all_questions
		Question.all.size
	end 

	def unanswered_questions_count
		participation.unanswered_questions.size
	end

	def answered_questions_count
		all_questions - unanswered_questions_count
	end 

end 

