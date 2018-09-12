class V1::BaseController < ActionController::Base
  before_action :require_login!
  helper_method :person_signed_in?, :current_user

  def user_signed_in?
    current_person.present?
  end

  #
  #function require_login!
  #check if users is logged in or not
  #
   def require_login!
    return true if authenticate_token
    render json: { errors: [ { detail: "Access denied" } ] }, status: 401
  end

   #
  #function restricted_login!
  #
  #function will check auth and check if token is restricted type
  #
   def restricted_login!
    return true if authenticate_token_restricted
    render json: { errors: [ { detail: "Access denied" } ] }, status: 401
  end

#
#Function current_user for API
#Function will assign authenticate_token to current user global variable
#
 def current_user
    @_current_user ||= authenticate_token
  end


    private

  
    def authenticate_token

      authenticate_with_http_token do |token, options|
        ApiToken.find_by(token_key: token)
      end

    end


  def authenticate_token_restricted

      authenticate_with_http_token do |token, options|
       db_token = ApiToken.find_by(token_key: token)
       if db_token.token_type == "restricted"
         return true
         else 
          return false
       end
        end

    end



end