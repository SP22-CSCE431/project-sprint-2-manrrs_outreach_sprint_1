json.extract! message_history, :id, :message_id, :date_sent, :student_id, :created_at, :updated_at
json.url message_history_url(message_history, format: :json)
