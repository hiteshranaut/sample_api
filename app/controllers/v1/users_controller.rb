class V1::UsersController < V1::BaseController
	skip_before_action :require_login!, only: [:create]

   
    def update_profile
	   user = User.where(:id => current_user.user)
	  if user.update(user_params)
	    render :json => {:user => user.to_json }
	   else
	    render :json => {:error => user.errors.full_messages.first}
	  end
	end  


	   private

  def user_params
    params.require(:user).permit(:username, :email, :first_name , :born_on , :full_name , :last_name , :gender , :city , :state , :country , :password, :password_confirmation, :remember_me)
  end



end