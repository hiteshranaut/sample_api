class V1::Feeds::ReviewsController < V1::BaseController

 # skip_before_action :require_login!, only: [:create]
 before_action :restricted_login!

  respond_to :json

  def index
     reviews = Review.filter(params.slice(:source , :business , :poster_name , :poster_username , :poster_email , :comment ))
     render json:  reviews
  end


  def show
    render json: Review.find(params[:id])
  end


end
