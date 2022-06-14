class Image
  attr_reader :id, :description, :alt_description, :url, :author, :portfolio, :source

  def initialize(attr)
    @description = attr[:description]
    @alt_description = attr[:alt_description]
    @url = attr[:urls][:regular]
    @author = attr[:user][:name]
    @portfolio = attr[:user][:portfolio_url]
    @source = "unsplash.com"
  end
end
