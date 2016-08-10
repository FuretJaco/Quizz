class ParticipationsController < ApplicationController
	def create
		participation = current_user.participations.create!
		first_question = Question.all.order(:id).first
		redirect_to new_participation_question_answer_path(participation_id: participation, question_id: first_question) 
	end 
end
