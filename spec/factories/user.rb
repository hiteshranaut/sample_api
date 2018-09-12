
if Rails.env.test?
	require 'factory_girl'

FactoryGirl.define do
    factory :user do
        sequence(:email) { |n| "user_#{n}@factory.com" }
        password Faker::Internet.password
        first_name     Faker::Name.first_name
        last_name      Faker::Name.last_name
        #username Faker::Name.first_name
         sequence(:username) { |n| "user_#{n}" }
        full_name Faker::Name.first_name
        born_on  DateTime.now
        gender "male"
        city "CV" 
        state "HP"  
        country "IN"
    end


  factory :user1 do
        id 1
        email  "hitesh@hitesh.com"
        password Faker::Internet.password
        first_name     Faker::Name.first_name
        last_name      Faker::Name.last_name
        username Faker::Name.first_name
        #sequence(:username) { |n| "user_#{n}" }
        full_name Faker::Name.first_name
        born_on  DateTime.now
        gender "male"
        city "CV" 
        state "HP"  
        country "IN"
  end

end

end
