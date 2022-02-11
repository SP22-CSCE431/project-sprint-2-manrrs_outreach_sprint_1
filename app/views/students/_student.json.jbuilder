json.extract! student, :id, :Student_ID, :First_Name, :Last_Name, :Phone_Number, :Email, :created_at, :updated_at
json.url student_url(student, format: :json)
