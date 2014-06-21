require "bcrypt"
class User < ActiveRecord::Base
  include BCrypt
  has_many :posts
  has_many :comments  
  
  # but even if i comment it out the test still passes why???
  validates_presence_of :username, :email, :password
  validates_uniqueness_of :username, :email
  validates_format_of :email, with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
  validates :password, length: { in: 6..20 }

  

  def self.from_omniauth(auth)
    where(auth.slice(:provider, :uid)).first_or_initialize.tap do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.name = auth.info.name
      user.oauth_token = auth.credentials.token
      user.oauth_expires_at = Time.at(auth.credentials.expires_at)
      user.save!
    end
  end

  def password
    @password
  end

  def password=(new_password)
    @password = new_password
    self.password_digest = BCrypt::Password.create(new_password)

  end

  def authenticate(test_password)
    if BCrypt::Password.new(self.password_digest) == test_password
      self
    else
      false
    end
  end
end
