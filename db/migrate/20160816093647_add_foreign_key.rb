class AddForeignKey < ActiveRecord::Migration[5.0]
  def change
  	add_foreign_key :options, :questions 
  	add_foreign_key :answers, :options
  	add_foreign_key :answers, :participations
  	add_foreign_key :participations, :users
  end
end
