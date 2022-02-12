class CreateMessages < ActiveRecord::Migration[6.1]
  def change
    create_table :messages do |t|
      t.integer :admin_id
      t.string :text
      t.date :date_created

      t.timestamps
    end
  end
end
