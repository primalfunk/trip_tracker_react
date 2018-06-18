class CreateStops < ActiveRecord::Migration[5.2]
  def change
    create_table :stops do |t|
      t.string :name
      t.string :address
      t.belongs_to :trip, foreign_key: true

      t.timestamps
    end
  end
end
