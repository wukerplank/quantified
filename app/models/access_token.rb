class AccessToken < ActiveRecord::Base

  belongs_to :user

  before_validation :generate_token, on: :create

  def to_param
    token
  end

  private

  def generate_token
    self.token = Digest::MD5.hexdigest(SecureRandom.uuid)
  end

end
