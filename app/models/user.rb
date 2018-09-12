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

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable


  has_many :api_tokens
  attr_accessor :login
   GENDERS = ['male', 'female' , 'other']
  #ROLES = %w[admin moderator author banned].freeze
  

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,  :confirmable , :lockable , :timeoutable , :authentication_keys => [:login]



  

validates :username,
  :presence => true,
  :uniqueness => {
    :case_sensitive => false
  } # etc.


 
  validates_format_of :username, with: /^[a-zA-Z0-9_\.]*$/, :multiline => true


  validate :validate_username
#full_name, email, username, gender, born_on, city, state, country, is_confirmed, is_admin

  #requre presence of below fields 
  validates :email, :full_name , :gender , :born_on , :city , :state , :country , :presence => true

    #validate presence of GENDERS in gender field
    validates_inclusion_of :gender, :in => GENDERS


   #validates length of country and state is 2
    validates :state, :country , length: { is: 2 }

#function is validating username
def validate_username
  if User.where(email: username).exists?
    errors.add(:username, :invalid)
  end
end


#function is used to auth user using username
 def self.find_first_by_auth_conditions(warden_conditions)
  conditions = warden_conditions.dup
  if login = conditions.delete(:login)
    where(conditions).where(["lower(username) = :value OR lower(email) = :value", { :value => login.downcase }]).first
  else
    if conditions[:username].nil?
      where(conditions).first
    else
      where(username: conditions[:username]).first
    end
  end
end


 protected
def confirmation_required?
  false
end



end
