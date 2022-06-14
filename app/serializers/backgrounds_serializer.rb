class BackgroundsSerializer
  include JSONAPI::Serializer
  attributes :description, :alt_description, :url, :author, :portfolio, :source
end
