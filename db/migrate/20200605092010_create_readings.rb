class CreateReadings < ActiveRecord::Migration[6.0]
  def change
    create_table :readings do |t|
      t.integer :glucose_level
      t.date :created_on
      t.references :user, null: false, foreign_key: true

      t.timestamps

    end
    #Add indexes to glucose_level and created_on
    add_index :readings, :glucose_level
    add_index :readings, :created_on
  end
end
