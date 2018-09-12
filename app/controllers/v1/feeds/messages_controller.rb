class V1::Feeds::MessagesController < V1::BaseController

 # skip_before_action :require_login!, only: [:create]
 before_action :restricted_login!

  respond_to :json

 
end

