class User < ActiveRecord::Base
  has_many :receivers,:dependent => :destroy
  attr_accessible :first_name,:last_name,:name, :email, :password, :password_confirmation,:active,:password_digest
  has_secure_password

  before_save { |user| user.email = email.downcase }
  before_save :create_remember_token
  validates :name, presence: true, length: { maximum: 50 }
  validates :first_name, presence: true, length: { maximum: 50 }
  validates :last_name, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence:   true,
                    format:     { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  validates :password, presence: true, length: { minimum: 6 }
  validates :password_confirmation, presence: true
  
  private

  def create_remember_token
    # Create the token.
    self.remember_token = SecureRandom.urlsafe_base64
  end
end
