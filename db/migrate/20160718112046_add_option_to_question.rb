class AddOptionToQuestion < ActiveRecord::Migration[5.0]
  def change
  	add_column :options, :question_id, :integer 
  	add_index :options, :question_id
  end
end
