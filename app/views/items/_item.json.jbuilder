json.extract! item, :id, :reference_ID, :title, :artist, :genre, :release_date, :label, :image, :price, :created_at, :updated_at
json.url item_url(item, format: :json)
