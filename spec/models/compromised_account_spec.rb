# == Schema Information
#
# Table name: compromised_accounts
#
#  id                            :uuid             not null, primary key
#  username                      :string
#  email                         :string
#  suspected_compromised_service :string
#  leak_source                   :string
#  created_at                    :datetime         not null
#  updated_at                    :datetime         not null
#

require 'rails_helper'

RSpec.describe CompromisedAccount, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
