class BackgroundsSerializer
  include JSONAPI::Serializer
  attributes :id, :description, :alt_description, :url, :author, :portfolio
end
