class CreateStops < ActiveRecord::Migration
  def change
    create_table :stops do |t|
      t.string :name, null: false
      t.boolean :is_terminus, null: false, default: false
    end
  end
end