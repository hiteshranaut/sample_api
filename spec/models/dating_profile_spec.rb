# == Schema Information
#
# Table name: dating_profiles
#
#  id            :uuid             not null, primary key
#  source        :string
#  name          :string
#  username      :string
#  gender        :string
#  description   :string
#  location_lat  :float
#  location_long :float
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

require 'rails_helper'

RSpec.describe DatingProfile, type: :model do
  
end
