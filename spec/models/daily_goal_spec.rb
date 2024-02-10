# == Schema Information
#
# Table name: daily_goals
#
#  id           :bigint           not null, primary key
#  calorie_goal :integer
#  protein_goal :integer
#  fat_goal     :integer
#  carbs_goal   :integer
#  sugar_goal   :integer
#  account_id   :bigint           not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
require 'rails_helper'

RSpec.describe DailyGoal, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
