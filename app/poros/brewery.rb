class Brewery
  attr_reader :name, :brewery_type

  def initialize(attr)
    @name = attr[:name]
    @brewery_type = attr[:brewery_type]
  end
end
