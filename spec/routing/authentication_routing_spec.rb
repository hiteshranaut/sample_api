require 'rails_helper'

# RSpec.describe V1::AuthenticationController, type: :routing do
  describe 'authentication routing' do
    it 'routes to POST /v1/users/auth.json to user_token#create' do
      expect(:post => '/v1/users/auth.json').to route_to({"format"=>"json", "controller"=>"v1/sessions", "action"=>"create"})
    end

     it 'routes to POST /v1/users to v1/registrations#create' do
      expect(:post => '/v1/users.json').to route_to({"format"=>"json", "controller"=>"v1/registrations", "action"=>"create"})
    end


   it 'routes to GET /users/current to v1/sessions#current' do
      expect(:get => '/v1/users/current.json').to route_to({"format"=>"json", "controller"=>"v1/sessions", "action"=>"current"})
    end   

    it 'routes to POST /users/current to v1/registrations#update' do
      expect(:post => '/v1/users/current.json').to route_to({"format"=>"json", "controller"=>"v1/registrations", "action"=>"update"})
    end


   it 'routes to GET v1/users/ to v1/sessions#users' do
      expect(:get => '/v1/users.json').to route_to({"format"=>"json", "controller"=>"v1/sessions", "action"=>"users"})
    end




  end




describe 'GET /v1/users' , :type => :request do
 # let!(:users) { FactoryGirl.create_list(:user, 10) }
  # before { get '/v1/users' }

  # it 'returns HTTP status 401' do
  #   expect(response).to have_http_status 401
  # end





it 'returns HTTP status 401' do
		get '/v1/users'
		expect(response.status).to be(401)
end


end


describe "POST /v1/users" , :type => :request do
# let(:auth_headers) {
#    { 'Authorization' => 'Token token="kdfkalsdfaksdljfad3434343434343"' }
#  }
#let(:user) { FactoryGirl.create(:user1) }
  it "POST request to /v1/users to user registrations" do
  	#request.headers["Accept"] = "application/json" 
  	# header 'Authorization', 'Token token="kdfkalsdfaksdljfad3434343434343"'
  # post '/v1/users' ,  xhr: true,   {"user"=>{"email"=>"testtt@teshht.com", "full_name"=>"testtt", "password"=>"password123", "username"=>"deshdeshhh", "gender"=>"male", "born_on"=>"2017-06-27", "city"=>"cityname", "state"=>"NY", "country"=>"VR"}}
   params = {"user"=>{"email"=>"testtt@teshht.com", "full_name"=>"testtt", "password"=>"password123", "username"=>"deshdeshhh", "gender"=>"male", "born_on"=>"2017-06-27", "city"=>"cityname", "state"=>"NY", "country"=>"VR"}}
   post '/v1/users' , params: params.to_json, headers: { 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json' } 
   # get "/v1/users/current" , xhr: true, headers: auth_headers
    expect(response.status).to eq 201
  end


it "POST request to /v1/users to user registrations expec status 422 if same user is reg 2 times" do
  	#request.headers["Accept"] = "application/json" 
 
  # post '/v1/users' ,  xhr: true,   {"user"=>{"email"=>"testtt@teshht.com", "full_name"=>"testtt", "password"=>"password123", "username"=>"deshdeshhh", "gender"=>"male", "born_on"=>"2017-06-27", "city"=>"cityname", "state"=>"NY", "country"=>"VR"}}
   #user send 1st time
   params = {"user"=>{"email"=>"testtt@teshht.com", "full_name"=>"testtt", "password"=>"password123", "username"=>"deshdeshhh", "gender"=>"male", "born_on"=>"2017-06-27", "city"=>"cityname", "state"=>"NY", "country"=>"VR"}}
   post '/v1/users' , params: params.to_json, headers: { 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json' } 
   #same user sent 2nd time
  post '/v1/users' , params: params.to_json, headers: { 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json' } 
   # get "/v1/users/current" , xhr: true, headers: auth_headers
    expect(response.status).to eq 422
  end



  it "will POST request to /v1/users To register new user Post request to /v1/users/auth.json to login new created user and use created token to get list of all Users" do
  	#request.headers["Accept"] = "application/json" 
  	# header 'Authorization', 'Token token="kdfkalsdfaksdljfad3434343434343"'
   FactoryGirl.create_list(:user, 10)
  # post '/v1/users' ,  xhr: true,   {"user"=>{"email"=>"testtt@teshht.com", "full_name"=>"testtt", "password"=>"password123", "username"=>"deshdeshhh", "gender"=>"male", "born_on"=>"2017-06-27", "city"=>"cityname", "state"=>"NY", "country"=>"VR"}}
   #user send 1st time
   params = {"user"=>{"email"=>"testtt@teshht.com", "full_name"=>"testtt", "password"=>"password123", "username"=>"deshdeshhh", "gender"=>"male", "born_on"=>"2017-06-27", "city"=>"cityname", "state"=>"NY", "country"=>"VR"}}
   post '/v1/users' , params: params.to_json, headers: { 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json' } 
   #same user sent 2nd time
   
    params = {"email"=>"testtt@teshht.com", "password"=>"password123"}
   post '/v1/users/auth.json' ,  params: params.to_json, headers: { 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json'} 
   token = ApiToken.first.token_key

   get '/v1/users',  xhr: true,  headers: { 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json' , 'Authorization' => "Token token=#{token}" } 
   #expect(token.length).to be(2)
   json = JSON.parse(response.body)
   # use this to print code in rspec
   # $stderr.puts "method TEXT"
   # $stderr.puts response.body
   # get "/v1/users/current" , xhr: true, headers: auth_headers
    expect(response.status).to eq 200
      # test for the 200 status-code
    expect(response).to be_success
    # check to make sure the right amount of messages are returned
    #10 users created by FactoryGirl
    #1 user is created by registration end-point used above
    expect(json['users'].length).to eq(11)
  end






end





# end

  # describe 'GET /v1/users' do
  #     let!(:users) { FactoryGirl.create_list(:user, 10) }

  #     before { get '/v1/users', headers: auth_headers(current_user) }

  #     it 'returns HTTP status 200' do
  #       expect(response).to have_http_status 200
  #     end


  #   end
