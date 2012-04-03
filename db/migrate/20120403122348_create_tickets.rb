class CreateTickets < ActiveRecord::Migration
  def change
    create_table :tickets do |t|
      t.string :number, null: false
      t.decimal :amount, null: false, precision: 5, scale: 2
      t.string :status, null: false, default: 'new', limit: 12
      t.references :schedule, :customer, null: false

      t.timestamps
    end

    add_index :tickets, :number, name: "UNIQUE_tickets", unique: true
  end
end