class V1::SessionsController < V1::BaseController
	skip_before_action :require_login!, only: [:create]


     #Function Create
     #@params Username (String)
     #@params Password (String)
     #@return API_Token.

	  def create
        
         if !params[:email].nil?
         	resource = User.find_for_database_authentication(:email => params[:email])
         else 
         	resource = User.find_for_database_authentication(:username => params[:username])
         end

	    resource ||= User.new

	    if resource.valid_password?(params[:password])
	    #  auth_token = resource.generate_auth_token
	      auth_token = resource.api_tokens.build(:name => "Name" , :token_type => "normal" , :is_live => true , :token_key => SecureRandom.hex(16) , :token_secret => SecureRandom.hex(16) , :description => "pop" )
           if resource.save
           	 render json: { auth_token: auth_token }
           end
	     
	    else
	      invalid_login_attempt
	    end

	  end

    #return current_user
	  def current
	  	render :json => {user: current_user.user} , status: 200
	  end


    #
    #Function users
    #Render all users.
	  def users
	    render json: { users: User.all }
	  end

     def destroy
	    resource = current_person
	    #puts current_person
	  end

  private


    def invalid_login_attempt
      render json: { errors: [ { detail:"Error with your login or password" }]}, status: 401
    end



end