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

class Review < ApplicationRecord
	include Filterable
	   scope :source, -> (source) { where source: source }
	   scope :business, -> (business) { where business: business }
	   scope :poster_name, -> (poster_name) { where poster_name: poster_name }
	   scope :poster_username, -> (poster_username) { where poster_username: poster_username }
	   scope :poster_email, -> (poster_email) { where poster_email: poster_email }
	   scope :comment, -> (comment) { where comment: comment }
	  

end
