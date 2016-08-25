class AddQuizzToParticipation < ActiveRecord::Migration[5.0]
  def change
  	add_column :participations, :quizz_id, :integer
  	add_index :participations, :quizz_id
  end
end
