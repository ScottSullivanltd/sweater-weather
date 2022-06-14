class Brewery
  attr_reader :brewery_id, :name, :brewery_type

  def initialize(attr)
    @brewery_id = attr[:id]
    @name = attr[:name]
    @brewery_type = attr[:brewery_type]
  end
end
