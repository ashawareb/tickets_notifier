class CreateEmailSettings < ActiveRecord::Migration[7.1]
  def change
    create_table :email_settings do |t|
      t.belongs_to :user
      t.boolean :send_due_date_reminder_email, default: true
      t.integer :due_date_reminder_email_interval, default: 0
      t.time :due_date_reminder_email_time, default: '09:00:00'
      t.timestamps
    end
  end
end
