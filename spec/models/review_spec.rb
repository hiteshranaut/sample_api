# == Schema Information
#
# Table name: reviews
#
#  id              :uuid             not null, primary key
#  source          :string
#  business        :string
#  poster_name     :string
#  poster_username :string
#  poster_email    :string
#  comment         :string
#  rating          :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

require 'rails_helper'

RSpec.describe Review, type: :model do
  
end
