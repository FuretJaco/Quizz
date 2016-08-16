class AddIndexToQuestion < ActiveRecord::Migration[5.0]
  def change
  	add_index :questions, :body
  	add_index :questions, :title 
  end
end
