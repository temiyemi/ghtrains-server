class CreateTrains < ActiveRecord::Migration
  def change
    create_table :trains do |t|
      t.string :number, null: false
      t.integer :cabins, null: false
      t.integer :seats, null: false

      t.timestamps
    end

    add_index :trains, :number, name: "UNIQUE_trains", unique: true
  end
end