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

class CompromisedService < ApplicationRecord
		include Filterable
	   scope :services, -> (services) { where services: services }
	   scope :leak_source, -> (leak_source) { where leak_source: leak_source }
end
