# frozen_string_literal: true

# == Route Map
#

Rails.application.routes.draw do
  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get 'up' => 'rails/health#show', as: :rails_health_check

  # Meals
  post 'meals' => 'meals#create'
  post 'full_meal' => 'meals#create_full_meal'

  # Daily goals
  get 'daily_goal' => 'daily_goals#show'
  post 'daily_goals' => 'daily_goals#create'

  # Units
  get 'units' => 'units#index'

  # Defines the root path route ("/")
  # root "posts#index"
end
