class CreateTickets < ActiveRecord::Migration[7.1]
  def change
    create_table :tickets do |t|
      t.belongs_to :user
      t.string :title
      t.text :description
      t.integer :status, default: 1
      t.integer :reminder_status, default: 1
      t.string :job_id
      t.date :due_date
      t.timestamps
    end
  end
end
