# == Schema Information
#
# Table name: units
#
#  id         :bigint           not null, primary key
#  unit_type  :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require 'rails_helper'

RSpec.describe Unit, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
