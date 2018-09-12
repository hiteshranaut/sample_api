# Fabricator(:review) do
#   source          "MyString"
#   business        "MyString"
#   poster_name     "MyString"
#   poster_username "MyString"
#   poster_email    "MyString"
#   comment         "MyString"
#   rating          1
# end





if Rails.env.test?
	require 'factory_girl'

FactoryGirl.define do

    factory :review do
    	#  source          :string
    	sequence(:source) { |n| "source_#{n}" }
    	sequence(:business) { |n| "business_#{n}" }
    	sequence(:poster_name) { |n| "poster_name_#{n}" }
    	sequence(:poster_username) { |n| "poster_username_#{n}" }
    	# sequence(:poster_email) { |n| "poster_email_#{n}" }

    	sequence(:poster_email) { |n| "poster_email_#{n}@factory.com" }
    	sequence(:comment) { |n| "this is comment #{n}" }

        rating 34
		
           end

  end

end
