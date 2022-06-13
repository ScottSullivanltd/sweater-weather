class Image
  attr_reader :description, :alt_description, :url, :author, :portfolio

  def initialize(attr)
    @description = attr[:results][0][:description]
    @alt_description = attr[:results][0][:alt_description]
    @url = attr[:results][0][:urls][:regular]
    @author = attr[:results][0][:user][:name]
    @portfolio = attr[:results][0][:user][:portfolio_url]
  end
end
