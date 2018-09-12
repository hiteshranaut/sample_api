



if Rails.env.test?
	require 'factory_girl'

FactoryGirl.define do
    factory :compromised_account do
   sequence(:username) { |n| "user_#{n}" }
  sequence(:email) { |n| "compromised_account_user_#{n}@factory.com" }
  suspected_compromised_service "MyString"
  leak_source                   "MyString"

           end




end

end
