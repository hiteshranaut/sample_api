
if Rails.env.test?
	require 'factory_girl'

FactoryGirl.define do
    

  factory :api_token do
         id            1            
         name         "Name"
         token_type   "normal"
         token_key    "kdfkalsdfaksdljfad3434343434343"
         token_secret "fklsdfkladklfakldfakljdfaklj234lkj24kl"
         description  "description for api"
         is_live      true
         user_id      1
  end

  factory :api_token2 do     
         name         "Name"
         token_type   "restricted"
         token_key    "kdfkalsdfaksdljfad3434343434343"
         token_secret "fklsdfkladklfakldfakljdfaklj234lkj24kl"
         description  "description for api"
         is_live      true
         user_id      1
  end

end

end
