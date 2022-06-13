class User < ApplicationRecord
  before_create do
    self.api_token = SecureRandom.hex(13)
  end
end
