json.extract! message, :id, :admin_id, :text, :date_created, :created_at, :updated_at
json.url message_url(message, format: :json)
