# == Schema Information
#
# Table name: compromised_accounts
#
#  id                            :uuid             not null, primary key
#  username                      :string
#  email                         :string
#  suspected_compromised_service :string
#  leak_source                   :string
#  created_at                    :datetime         not null
#  updated_at                    :datetime         not null
#

class CompromisedAccount < ApplicationRecord
	include Filterable

	  scope :username, -> (username) { where username: username }
	  scope :email, -> (email) { where email: email }
	  scope :suspected_compromised_service, -> (suspected_compromised_service) { where suspected_compromised_service: suspected_compromised_service }
	  scope :leak_source, -> (leak_source) { where leak_source: leak_source }
	  # scope :location, -> (location_id) { where location_id: location_id }
	  # scope :starts_with, -> (name) { where("name like ?", "#{name}%")}



end
