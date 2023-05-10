json.extract! message, :id, :full_name, :email, :phone, :body, :created_at, :updated_at
json.url message_url(message, format: :json)
