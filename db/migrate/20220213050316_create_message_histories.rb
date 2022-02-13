class CreateMessageHistories < ActiveRecord::Migration[6.1]
  def change
    create_table :message_histories do |t|
      t.string :message_id
      t.date :date_sent
      t.string :student_id

      t.timestamps
    end
  end
end
