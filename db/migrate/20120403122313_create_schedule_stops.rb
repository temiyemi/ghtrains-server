class CreateScheduleStops < ActiveRecord::Migration
  def change
    create_table :schedule_stops do |t|
      t.references :schedule, :stop, null: false
      t.time :arrives_at, null: false
      t.time :departs_at, null: false
      t.integer :delay, null: false, default: 2
    end

    add_index :schedule_stops, :arrives_at, name: "INDEX_schedule_stops_by_arrival_time"

  end
end