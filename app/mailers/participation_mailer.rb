class ParticipationMailer < ApplicationMailer 

	def participation_finished(participation)
		@participation = participation
		mail(to: participation.user.email)
	end 
end 