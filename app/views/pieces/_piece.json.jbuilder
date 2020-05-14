json.extract! piece, :id, :name, :description, :quantity, :price, :created_at, :updated_at
json.url piece_url(piece, format: :json)
