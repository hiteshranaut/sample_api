# == Schema Information
#
# Table name: users
#
#  id                     :uuid             not null, primary key
#  email                  :string           default(""), not null
#  first_name             :string           default("")
#  last_name              :string           default("")
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :inet
#  last_sign_in_ip        :inet
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  confirmation_token     :string
#  confirmed_at           :datetime
#  confirmation_sent_at   :datetime
#  failed_attempts        :integer          default(0), not null
#  unlock_token           :string
#  locked_at              :datetime
#  username               :string
#  role                   :string
#  is_admin               :boolean          default(FALSE)
#  full_name              :string
#  gender                 :string
#  address_1              :string
#  address_2              :string
#  city                   :string
#  state                  :string
#  country                :string
#  born_on                :datetime
#
# Indexes
#
#  index_users_on_confirmation_token    (confirmation_token) UNIQUE
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#  index_users_on_unlock_token          (unlock_token) UNIQUE
#  index_users_on_username              (username) UNIQUE
#

require 'rails_helper'




RSpec.describe User, type: :model do
 # pending "add some examples to (or delete) #{__FILE__}"
#Failure/Error: expect(User.new(email: 'Anything')).to be_valid
    #   expected #<User id: nil, email: "anything", first_name: "", last_name: "",
       # created_at: nil, updated_at: nil, username: nil, role: nil, is_admin: false, full_name: nil, gender: nil,
       # address_1: nil, address_2: nil, city: nil, state: nil, country: nil, born_on: nil> 
       #to be valid, but got errors: 
       
       it { should have_many(:api_tokens) }
     




       user = User.new 

 it 'has a valid factory' do
    expect(FactoryGirl.create(:user)).to be_valid
  end

  context 'validations' do
      it { is_expected.to validate_presence_of :email }
      it { is_expected.to validate_uniqueness_of(:email).ignoring_case_sensitivity  }
      it { is_expected.to validate_uniqueness_of(:username).ignoring_case_sensitivity  }
      it { is_expected.to validate_confirmation_of :password }
      it { is_expected.to validate_presence_of :full_name }
      it { is_expected.to validate_presence_of :gender }
      it { is_expected.to validate_presence_of :city }
      it { is_expected.to validate_presence_of :state }
      it { is_expected.to validate_presence_of :country }
      it { should validate_length_of(:state).is_equal_to(2) }
      it { should validate_length_of(:country).is_equal_to(2) }
  end




 # email format is wrong
     it "is valid with valid attributes" do
        expect(User.create(:born_on => DateTime.now , :full_name => "Full Name" , :gender => "male", email: 'testt@test.com' , username: 'username' , password: 'password123' , city: "CV" , state: "HP" , country: "IN" )).to be_valid
     end


     it "should not create a user with a blank password" do
        user = User.new({email: "blah@blah.com"})
        expect(user.save).to be(false)
    end


     it "should confirm a user :password" do
        user = User.new({password: "blah", password_confirmation: "bla"})
        expect(user.save).to be(false)
    end


     it "should not create a user with a blank email" do
        user = User.new({password: "blah", password_confirmation: "blah"})
        expect(user.save).to be(false)
    end

     it "is not valid without a email" do
	    expect(user).to_not be_valid
	  end


   # email format is wrong
   #full_name, email, username, gender, born_on, city, state, country, is_confirmed, is_admin	
     it "is not valid with invalid attributes" do
        expect(User.create(email: 'test.com' , username: 'Username' , password: 'xfgfgf' , full_name: '' , gender: "male" , born_on: "" )).to_not be_valid
     end


  it "is not valid without a all required_attributes" do
	    expect(user).to_not be_valid
	  end



end
