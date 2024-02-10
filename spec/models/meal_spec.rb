# == Schema Information
#
# Table name: meals
#
#  id         :bigint           not null, primary key
#  name       :integer
#  meal_date  :datetime
#  account_id :bigint           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require 'rails_helper'

RSpec.describe Meal, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
