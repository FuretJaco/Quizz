class AddIndexParticipationToAnswer < ActiveRecord::Migration[5.0]
  def change
  	add_index :answers, :participation_id
  end
end
