class Participation < ApplicationRecord
	belongs_to :user
	has_many :answers

	def unanswered_questions
		all_questions = Question.all 
		#récupération d'une liste de questions pas encore utilisées via le maper 
		answered_questions = answers
			.select(&:persisted?)
			.map { |answer| answer.option.question}
		all_questions - answered_questions
	end
end
