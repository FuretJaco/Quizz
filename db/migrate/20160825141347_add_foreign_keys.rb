class AddForeignKeys < ActiveRecord::Migration[5.0]
  def change
  	add_foreign_key :questions, :quizzes
  	add_foreign_key :participations, :quizzes
  end
end
