json.extract! resource, :id, :name, :description, :category_id, :link, :last_modified, :created_at, :updated_at
json.url resource_url(resource, format: :json)