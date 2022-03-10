class CreateSights < ActiveRecord::Migration[6.0]
  def change
    create_table :sights do |t|
      t.string :name
      t.date :datetime
      t.integer :trip_id

      t.timestamps
    end
  end
end
