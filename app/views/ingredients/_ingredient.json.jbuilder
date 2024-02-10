json.extract! ingredient, :id, :name, :calories, :protein, :fat, :carbs, :sugar, :created_at, :updated_at
json.url ingredient_url(ingredient, format: :json)
