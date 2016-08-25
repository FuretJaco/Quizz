class AddQuizzToQuestion < ActiveRecord::Migration[5.0]
  def change
  	add_column :questions, :quizz_id, :integer
  	add_index :questions, :quizz_id
  end
end
