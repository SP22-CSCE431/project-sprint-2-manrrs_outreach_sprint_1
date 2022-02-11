json.extract! message_history, :id, :Message_ID, :Date_Sent, :Student_ID, :created_at, :updated_at
json.url message_history_url(message_history, format: :json)
