require "rails_helper"

RSpec.describe Image do
  it "creates a poro for an image", :vcr do
    attr =
      {
        description: "Community in Denver.",
        alt_description: nil,
        urls: {
          regular: "https://images.unsplash.com/photo-1634507307799-ace9b49840b7?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwzMzczNDZ8MHwxfHNlYXJjaHwzfHxkZW52ZXIlMkNjb3xlbnwwfHx8fDE2NTUwOTI4MTQ&ixlib=rb-1.2.1&q=80&w=1080"
        },
        user: {
          name: "Dillon Wanner",
          portfolio_url: "https://dillydally.myportfolio.com"
        }
      }

    image = Image.new(attr)

    expect(image.description).to eq("Community in Denver.")
    expect(image.alt_description).to eq(nil)
    expect(image.url).to eq("https://images.unsplash.com/photo-1634507307799-ace9b49840b7?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwzMzczNDZ8MHwxfHNlYXJjaHwzfHxkZW52ZXIlMkNjb3xlbnwwfHx8fDE2NTUwOTI4MTQ&ixlib=rb-1.2.1&q=80&w=1080")
    expect(image.author).to eq("Dillon Wanner")
    expect(image.portfolio).to eq("https://dillydally.myportfolio.com")
    expect(image.source).to eq("unsplash.com")
  end
end
