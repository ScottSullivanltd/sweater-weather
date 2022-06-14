class LoginSerializer
  include JSONAPI::Serializer
  attributes :email, :api_key
end
