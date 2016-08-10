class CreateParticipations < ActiveRecord::Migration[5.0]
  def change
    create_table :participations do |t|
      t.string :user_id
      t.string :integer

      t.timestamps
    end
  end
end
