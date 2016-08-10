class CreateOptions < ActiveRecord::Migration[5.0]
  def change
    create_table :options do |t|
      t.string :label
      t.string :value

      t.timestamps null: false
    end
  end
end
