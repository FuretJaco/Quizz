class ParticipationsController < ApplicationController
	def create
		quizz = Quizz.find(participation_params[:quizz_id])
		participation = current_user.participations.create!(quizz: quizz)
		first_question = quizz.questions.order(:id).first
		redirect_to new_participation_quizz_question_answer_path(quizz_id: quizz, participation_id: participation, question_id: first_question) 
	end 
	
	private 
		def participation_params
			params.require(:participation).permit(:quizz_id)
		end
end
