class CreateFeedbacks < ActiveRecord::Migration
  def change
    create_table :feedbacks do |t|
      t.references :customer, :staff, null: false
      t.text :message, null: false
      t.string :status, null: false
      t.references :feedback, default: 0, null: false

      t.timestamps
    end
    add_index :feedbacks, [:customer_id, :created_at], name: "INDEX_feedback_by_time"
  end

end