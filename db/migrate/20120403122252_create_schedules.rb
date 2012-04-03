class CreateSchedules < ActiveRecord::Migration
  def change
    create_table :schedules do |t|
      t.time :departs_at, null: false
      t.time :arrives_at, null: false
      t.references :route, :train, null: false

      t.timestamps
    end

    add_index :schedules, :route_id, name: "INDEX_schedules_by_route"
  end
end