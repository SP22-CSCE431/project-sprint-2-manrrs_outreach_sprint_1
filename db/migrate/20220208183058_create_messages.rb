class CreateMessages < ActiveRecord::Migration[6.1]
  def change
    create_table :messages do |t|
      t.string :Text
      t.date :Date_Created
      t.date :Date_Sent
      t.integer :Admin_ID
      t.integer :Message_ID

      t.timestamps
    end
  end
end
