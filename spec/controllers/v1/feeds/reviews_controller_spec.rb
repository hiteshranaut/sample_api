

RSpec.describe  V1::Feeds::ReviewsController , type: :controller do

# pending "add some examples to (or delete) #{__FILE__}"


describe 'GET /v1/feeds/' , :type => :request do


it "should get all reviews" do
  #create 10 reviews
  FactoryGirl.create_list(:review, 10)
  #created user object
  user = FactoryGirl.create(:user)
  # provided default values to api_token with token_type: restricted
  api_token = FactoryGirl.create(:api_token , user: user , token_type: "restricted" )
  get '/v1/feeds/reviews',  xhr: true,  headers: { 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json' , 'Authorization' => "Token token=#{api_token.token_key}" } 
  #expect(token.length).to be(2)
  json = JSON.parse(response.body)
  expect(response.status).to eq 200
  # test for the 200 status-code
  expect(response).to be_success
  #10 users created by FactoryGirl
  expect(json.length).to eq(10)
  end


  it "should get 401 response as token_type is normal " do
          #create 10 reviews
          FactoryGirl.create_list(:review, 10)
          #created user object
          user = FactoryGirl.create(:user)
          # provided default values to api_token with token_type: restricted
          api_token = FactoryGirl.create(:api_token , user: user , token_type: "normal" )
          get '/v1/feeds/reviews',  xhr: true,  headers: { 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json' , 'Authorization' => "Token token=#{api_token.token_key}" } 
          json = JSON.parse(response.body)
          expect(response.status).to eq 401
    end


  




end



end