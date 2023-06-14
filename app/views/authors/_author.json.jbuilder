json.extract! author, :id, :proper_name, :signature, :created_at, :updated_at
json.url author_url(author, format: :json)
