class V1::RegistrationsController < V1::BaseController

  skip_before_action :require_login!, only: [:create]

  respond_to :json

  #Function will create new User no access token is required.
  def create
      user = User.new(user_params)
    if user.save
      render :json=> user.as_json( :success=>  true , :email=>user.email) , :status=>201
      return
    else
      warden.custom_failure!
      render :json=> user.errors, :status=>422
    end
  end


#Function will update user Profile If user have valide access Token.
  def update 
   user = User.where(:id => current_user.user)
  if user.update(user_params)
    render :json => {:user => user }
   else
    render :json => {:error => user.errors.full_messages.first}
  end
end  

   private

  def user_params
    params.require(:user).permit(:username, :email, :first_name , :born_on , :full_name , :last_name , :gender , :city , :state , :country , :password, :password_confirmation, :remember_me)
  end


end

