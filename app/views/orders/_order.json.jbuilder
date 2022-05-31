json.extract! order, :id, :total_price, :qty, :deliver_date, :deliver_flg, :created_at, :updated_at
json.url order_url(order, format: :json)
