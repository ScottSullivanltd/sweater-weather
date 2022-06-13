class MapService < BaseService
  def self.get_lat_long(location)
    response = conn("http://open.mapquestapi.com").get("/geocoding/v1/address") do |f|
      f.params["key"] = ENV["maps_key"]
      f.params["location"] = location
    end
    get_json(response)[:results][0][:locations][0][:latLng]
  end
end
