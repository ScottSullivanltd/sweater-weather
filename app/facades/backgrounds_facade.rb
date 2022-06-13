class BackgroundsFacade
  def self.get_backgrounds(location)
    ImageService.get_image(location)
  end
end
