class AddParticipationToAnswer < ActiveRecord::Migration[5.0]
  def change
  	add_column :answers, :participation_id, :integer
  end
end
