require 'rails_helper'

RSpec.describe CreateMealService do
  describe '#call' do
    let(:account) { create(:account) }
    let(:unit) { create(:unit) }
    let(:params) do
      {
        name: 'breakfast',
        meal_date: Date.today,
        account_id: account.id,
        ingredients: [
          {
            name: 'Chicken Breast',
            quantity: 200.0,
            unit_type: unit.unit_type,
            calories: 165.0,
            protein: 31.0,
            fat: 3.6,
            carbs: 1.0,
            sugar: 1.0
          },
          {
            name: 'Brown Rice',
            quantity: 200.0,
            unit_type: unit.unit_type,
            calories: 165.0,
            protein: 31.0,
            fat: 3.6,
            carbs: 1.0,
            sugar: 1.0
          }
        ]
      }
    end

    context 'when the meal is successfully created' do
      it 'creates a new meal with ingredients' do
        service = CreateMealService.new(params)

        expect { service.call }.to change(Meal, :count).by(1)
                                                       .and change(Ingredient, :count).by(2)
                                                                                      .and change(MealIngredient, :count).by(2)

        meal = Meal.last
        expect(meal.name).to eq('breakfast')
        expect(meal.meal_date).to eq(Date.today)
        expect(meal.account_id).to eq(account.id)
        expect(meal.ingredients.count).to eq(2)
      end
    end

    context 'when the meal creation fails' do
      it 'returns an error message' do
        invalid_params = params.merge(meal_date: nil) # assuming name is required
        service = CreateMealService.new(invalid_params)

        service.call

        expect(Meal.count).to eq(0)
      end
    end

    context 'when an ingredient creation fails' do
      it 'does not create a meal or any ingredients and returns an error message' do
        allow(Ingredient).to receive(:create!).and_raise(ActiveRecord::RecordInvalid.new(Ingredient.new))
        service = CreateMealService.new(params)

        service.call

        expect(Meal.count).to eq(0)
        expect(Ingredient.count).to eq(0)
      end
    end
  end
end
