class ChangeNameQuizzsToQuizzes < ActiveRecord::Migration[5.0]
  def change
  	rename_table :quizzs, :quizzes
  end
end
