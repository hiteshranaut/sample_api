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

require 'rails_helper'

RSpec.describe ApiToken, type: :model do
 # pending "add some examples to (or delete) #{__FILE__}"
#include RSpec::Rails::ControllerExampleGroup
  
  it { should belong_to(:user) }

end
