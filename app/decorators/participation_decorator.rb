class ParticipationDecorator < ApplicationDecorator
	decorates :participation
	def all_questions
		all_questions = Question.all
	end 

	def count_unanswered_questions
		answered_questions = answers.map { |answer| answer.option.question}
		all_questions - answered_questions
	end

	def count_answered_questions
		all_questions - count_answered_questions 
	end 
end 