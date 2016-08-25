class MailWorker
  include Sidekiq::Worker
  def perform(email)
    ParticipationMailer.participation_finished(email).deliver
  end
end