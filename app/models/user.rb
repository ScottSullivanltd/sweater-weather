class User < ApplicationRecord
  before_create do
    self.api_key = SecureRandom.hex(13)
  end

  validates :email, uniqueness: true, presence: true
  validates_presence_of :password
  validates_presence_of :api_key

  has_secure_password
end
