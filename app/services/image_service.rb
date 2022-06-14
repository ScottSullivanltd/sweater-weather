class ImageService < BaseService
  def self.get_image(location)
    response = conn("https://api.unsplash.com").get("/search/photos") do |f|
      f.params["page"] = 1
      f.params["per_page"] = 5
      f.params["query"] = location
      f.params["client_id"] = ENV["upsplash_access_key"]
    end
    get_json(response)
  end
end
