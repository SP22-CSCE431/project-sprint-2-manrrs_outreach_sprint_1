class CreateCarriers < ActiveRecord::Migration[6.1]
  def change
    create_table :carriers do |t|
      t.string :domain

      t.timestamps
    end
  end
end
