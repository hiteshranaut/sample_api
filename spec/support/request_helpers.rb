module Request
  module JsonHelpers
    def json_response
      @json_response ||= JSON.parse(response.body, symbolize_names: true)
    end
  end


#AuthHelpers module for adding auth_headers in API test
  module AuthHelpers
    def auth_headers(user)
      token = Knock::AuthToken.new(payload: { sub: user.id }).token
      {
        'Authorization': "Token token=#{token}"
      }
    end
  end



end