class ImageSerializer
  include JSONAPI::Serializer
  set_type :image
  set_id :nil?
  attributes :description, :alt_description, :url, :author, :portfolio
end
