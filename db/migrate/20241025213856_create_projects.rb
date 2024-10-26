class CreateProjects < ActiveRecord::Migration[7.0]
  def change
    create_table :projects do |t|
      t.string :title
      t.decimal :donation_goal
      t.references :user, null: false, foreign_key: true
      t.integer :current_donation_amount, default: 0
      t.datetime :expires_at, default: "2025-02-29 22:59:39"
      t.string :status, default: "active"
      t.integer :backings_count, default: 0

      t.timestamps
    end
  end
end
