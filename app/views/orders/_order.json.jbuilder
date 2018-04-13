json.extract! order, :id, :order_id, :order_date, :user_id, :status, :created_at, :updated_at
json.url order_url(order, format: :json)
