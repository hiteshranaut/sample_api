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

class DatingProfile < ApplicationRecord
	   include Filterable
	   scope :source, -> (source) { where source: source }
	   #scope :name, -> (name) { where name: name }
	   scope :username, -> (username) { where username: username }
	   scope :gender, -> (gender) { where gender: gender }
	   scope :description, -> (description) { where description: description }

	   has_many :messages

	   SOURCE = ['Tinder', 'Bumble' , 'OkCupid' , 'Plenty of Fish' , 'Grinder' , 'Scissor']
       GENDERS = ['male', 'female' , 'other']
       
       #validation for present of source
       validates_inclusion_of :source, :in => SOURCE
       #validate presence of GENDERS in gender field
       validates_inclusion_of :gender, :in => GENDERS 


end
