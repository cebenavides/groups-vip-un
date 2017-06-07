json.extract! publication, :id, :name, :link, :created_at, :updated_at
json.url publication_url(publication, format: :json)
