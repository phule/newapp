class StateSignup < ActiveRecord::Base
  attr_accessible :email,:active,:token_signup
  validates :email,uniqueness:true
  #before_save :create_signup_token
  private

  def create_signup_token
    # Create the token.
    self.token_signup = SecureRandom.urlsafe_base64
  end
end
