class V1::Feeds::CompromisedServicesController < V1::BaseController

 # skip_before_action :require_login!, only: [:create]
 before_action :restricted_login!

  respond_to :json

  def index
     compromised_services = CompromisedService.filter(params.slice(:services , :leak_source ))
     render json:  compromised_services
  end

  def show
    render json: CompromisedService.find(params[:id])
  end


end

