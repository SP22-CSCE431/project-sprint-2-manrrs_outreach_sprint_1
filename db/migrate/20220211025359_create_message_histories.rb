class CreateMessageHistories < ActiveRecord::Migration[6.1]
  def change
    create_table :message_histories do |t|
      t.string :Message_ID
      t.date :Date_Sent
      t.string :Student_ID

      t.timestamps
    end
  end
end
