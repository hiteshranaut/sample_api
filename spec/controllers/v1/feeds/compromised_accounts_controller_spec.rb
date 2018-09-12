

RSpec.describe  V1::Feeds::CompromisedAccountsController , type: :controller do

# pending "add some examples to (or delete) #{__FILE__}"



describe 'GET /v1/feeds/' , :type => :request do

it "should get all compromised accounts as token type is restricted" do
  #created demo compromised accounts 10
  FactoryGirl.create_list(:compromised_account, 10)
  #created user
  user = FactoryGirl.create(:user)
  #token_type restricted api token is created
  api_token = FactoryGirl.create(:api_token , user: user  , token_type: "restricted" )
  #get request to fecth all compromised account request sent
  get '/v1/feeds/dark-web/compromised-accounts',  xhr: true,  headers: { 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json' , 'Authorization' => "Token token=#{api_token.token_key}" } 
  json = JSON.parse(response.body)

   expect(response.status).to eq 200
   expect(response).to be_success
   expect(json.length).to eq(10)
  end


it "should get 401 as compromised accounts are restricted and in this token_type is normal" do
   FactoryGirl.create_list(:compromised_account, 10)
   user = FactoryGirl.create(:user)
   api_token = FactoryGirl.create(:api_token , user: user  )
   params = {"email"=>"testtt@teshht.com", "password"=>"password123"}
   post '/v1/users/auth.json' ,  params: params.to_json, headers: { 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json'} 
   token = ApiToken.first.token_key
   get '/v1/feeds/dark-web/compromised-accounts',  xhr: true,  headers: { 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json' , 'Authorization' => "Token token=#{token}" } 
   json = JSON.parse(response.body)
   expect(response.status).to eq 401
   end



  




end



end