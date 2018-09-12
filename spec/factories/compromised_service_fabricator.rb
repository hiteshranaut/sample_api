# Fabricator(:compromised_service) do
#   services         "MyString"
#   confidence_lvl   1
#   compromise_count 1
#   leak_source      "MyString"
# end





if Rails.env.test?
	require 'factory_girl'

FactoryGirl.define do
    factory :compromised_service do
		   sequence(:services) { |n| "services_#{n}" }
            confidence_lvl 34
            compromise_count 23
             sequence(:leak_source) { |n| "leak_source_#{n}" }
           end
end

end
