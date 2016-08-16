class AddIndexToOption < ActiveRecord::Migration[5.0]
  def change
  	add_index :options, :label
  	add_index :options, :value
  end
end
