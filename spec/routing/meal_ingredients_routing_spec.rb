require 'rails_helper'

RSpec.describe MealIngredientsController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/meal_ingredients').to route_to('meal_ingredients#index')
    end

    it 'routes to #show' do
      expect(get: '/meal_ingredients/1').to route_to('meal_ingredients#show', id: '1')
    end

    it 'routes to #create' do
      expect(post: '/meal_ingredients').to route_to('meal_ingredients#create')
    end

    it 'routes to #update via PUT' do
      expect(put: '/meal_ingredients/1').to route_to('meal_ingredients#update', id: '1')
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/meal_ingredients/1').to route_to('meal_ingredients#update', id: '1')
    end

    it 'routes to #destroy' do
      expect(delete: '/meal_ingredients/1').to route_to('meal_ingredients#destroy', id: '1')
    end
  end
end
