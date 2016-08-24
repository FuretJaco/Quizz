class MailWorker
  include Sidekiq::Worker
  def perform(participation)
    ParticipationMailer.participation_finished(participation).deliver
  end
end