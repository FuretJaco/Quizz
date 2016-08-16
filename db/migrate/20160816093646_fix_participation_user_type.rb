class FixParticipationUserType < ActiveRecord::Migration[5.0]
	
	class Participation < ActiveRecord::Base
	end 


  def up
  	rename_column :participations, :user_id, :user_ref
  	add_column :participations, :user_id, :integer
  	Participation.reset_column_information
  	Participation.all.find_each do |participation|
  		participation.user_id = participation.user_ref.to_i
  		participation.save!
  	end 
  	remove_column :participations, :user_ref
  end
  def down 
  	raise ActiveRecord::IrreversibleMigration
  end  
end
