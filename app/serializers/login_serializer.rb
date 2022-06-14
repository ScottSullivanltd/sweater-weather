class LoginSerializer
  include JSONAPI::Serializer
  attributes :email, :api_key

  set_type :users
end
