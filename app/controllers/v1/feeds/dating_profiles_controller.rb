class V1::Feeds::DatingProfilesController < V1::BaseController

 # skip_before_action :require_login!, only: [:create]
 before_action :restricted_login!

  respond_to :json

  def index
     dating_profiles = DatingProfile.filter(params.slice(:source  , :name , :username , :gender , :description  ))
     render json:  dating_profiles
  end

  def show
    render json: DatingProfile.find(params[:id])
  end


end

