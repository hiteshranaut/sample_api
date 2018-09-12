class V1::Feeds::CompromisedAccountsController < V1::BaseController

 # skip_before_action :require_login!, only: [:create]
 
 before_action :restricted_login!

  respond_to :json

  def index
     compromised_accounts = CompromisedAccount.filter(params.slice(:username , :email , :leak_source , :suspected_compromised_service))
     render json:  compromised_accounts
  end


  def show
    render json: CompromisedAccount.find(params[:id])
  end


end

