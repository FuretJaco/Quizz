class ParticipationMailer < ApplicationMailer 

	def participation_finished(email)
		mail(to: email)
	end 
end 