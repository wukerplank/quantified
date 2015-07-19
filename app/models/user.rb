class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :access_tokens
  has_many :event_types
  has_many :events
  has_many :scopes

  def generate_access_token
    new_token = access_tokens.create!
    return new_token
  end

  def self.authenticate_with_token(token)
    return token.user if token = AccessToken.find_by_token(token)

    return false
  end

end
