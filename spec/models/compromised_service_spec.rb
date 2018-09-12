# == Schema Information
#
# Table name: compromised_services
#
#  id               :uuid             not null, primary key
#  services         :string
#  confidence_lvl   :integer
#  compromise_count :integer
#  leak_source      :string
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

require 'rails_helper'

RSpec.describe CompromisedService, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
