require 'csv'

class Seed

  def self.start
    seed = Seed.new
    seed.destroy_data
    seed.populate_breweries
  end

  def destroy_data
    Brewery.destroy_all
  end

  def populate_breweries
    Brewery.create([{
      name: "Cerebral Brewing",
      owner:"Sean Buchan, Chris WashenBerger, Dan McGuire",
      address: "1477 Monroe St",
      city: "Denver",
      state: "Colorado",
      description:"Cerebral Brewing is a neighborhood brewery in the Bluebird District of Denver, Colorado. Our goal is to combine scientific methodology with an artistic viewpoint to create extremely drinkable beers spanning a broad spectrum of styles.",
      creation_date: "2013/01/01",
      url: "http://cerebralbrewing.com/"
      }])

      puts "Breweries Successfully Seeded"
  end

  def populate_breweries
    CSV.foreach("./db/data/breweries.csv", :headers => true) do |row|
      Brewery.create!(row.to_hash)
    end
    puts "Breweries Successfully Seeded"
  end
end

Seed.start
