json.extract! article, :id, :title, :message, :author, :created_at, :updated_at
json.url article_url(article, format: :json)
