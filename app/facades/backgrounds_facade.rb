class BackgroundsFacade
  def self.get_backgrounds(location)
    image_data = ImageService.get_image(location)
    Image.new(image_data[:results][0])
  end
end
