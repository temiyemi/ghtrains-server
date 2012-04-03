class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.string :app_key, null: false, limit: 20
      t.string :name
      t.string :email
      t.integer :number

      t.timestamps
    end

    add_index :customers, :app_key, name: "UNIQUE_customers", unique: true

  end
end