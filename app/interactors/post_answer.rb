class PostAnswer 
	include Interactor
	def call
		save_answer
		send_email_if_finished
	end 

	private
	delegate :participation, :answer_params, to: :context
	delegate :answer, to: :context 
	def save_answer
		context.answer = participation.answers.build(answer_params)
		answer.save or context.fail!
	end 

	def send_email_if_finished
		#close de garde 
		return unless finished?
		ParticipationMailer.participation_finished(participation).deliver_later
	end 

	def finished?
		participation.unanswered_questions.empty? 
	end 
end 
