# == Schema Information
#
# Table name: api_tokens
#
#  id           :uuid             not null, primary key
#  name         :string
#  token_type   :string
#  token_key    :string
#  token_secret :string
#  description  :string
#  is_live      :boolean
#  user_id      :uuid
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
# Indexes
#
#  index_api_tokens_on_token_key     (token_key) UNIQUE
#  index_api_tokens_on_token_secret  (token_secret) UNIQUE
#  index_api_tokens_on_user_id       (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#

class ApiToken < ApplicationRecord
  belongs_to :user

   TOKEN_TYPE  = ['normal' ,'restricted']


  validates_inclusion_of :token_type, :in => TOKEN_TYPE

  #toke_type, name, token_key, toke_secret, description, user_id, is_live
    validates :token_type, :name , :token_key , :token_secret , :description , :user_id , :presence => true

    #Generate autho token and store value in databaes

      def generate_auth_token
	    token = SecureRandom.hex
	    #self.update_columns(token_key: token)
	    token
	  end

	  def invalidate_auth_token
	    self.update_columns(token_key: nil)
	  end




end
