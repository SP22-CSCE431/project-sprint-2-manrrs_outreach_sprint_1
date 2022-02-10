json.extract! message, :id, :Text, :Date_Created, :Date_Sent, :Admin_ID, :Message_ID, :created_at, :updated_at
json.url message_url(message, format: :json)
