json.extract! course, :id, :subject, :description, :created_at, :updated_at
json.url course_url(course, format: :json)
