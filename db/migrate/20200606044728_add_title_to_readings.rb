class AddTitleToReadings < ActiveRecord::Migration[6.0]
  def change
    add_column :readings, :title, :string
  end
end
