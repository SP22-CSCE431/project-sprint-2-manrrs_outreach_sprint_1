class CreateStudents < ActiveRecord::Migration[6.1]
  def change
    create_table :students do |t|
      t.string :Student_ID
      t.string :First_Name
      t.string :Last_Name
      t.bigint :Phone_Number
      t.string :Email

      t.timestamps
    end
  end
end
