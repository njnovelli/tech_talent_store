json.extract! order, :id, :subtotal, :grand_total, :user_id, :order_items, :sales_tax, :created_at, :updated_at
json.url order_url(order, format: :json)