class ParticipationDecorator < ApplicationDecorator
	decorates :participation

	#def count_answered_questions
		#@count_answered_questions = Question.count - Participation.unanswered_questions
	#end

	#def count_unanswered_questions
		#@count_unanswered_questions = Question.count - @count_answered_questions
	#end 
end 