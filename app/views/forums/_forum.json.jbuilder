json.extract! forum, :id, :subject, :description, :created_at, :updated_at
json.url forum_url(forum, format: :json)
