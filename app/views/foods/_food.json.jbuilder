json.extract! food, :id, :item_name, :variety, :comment, :storage_method, :harvest, :price, :stock, :image, :created_at, :updated_at
json.url food_url(food, format: :json)
