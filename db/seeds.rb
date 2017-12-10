require 'csv'

class Seed

  def self.start
    seed = Seed.new
    seed.destroy_data
    seed.populate_breweries
  end

  def initialize
    @token = ENV["FACEBOOK_TOKEN"]
    @breweries = {
      # "Avalanche Brewing Co" => 36572226900,
      "Avery Brewing Company" => 129355431997,
      "Baere Brewing Company" => 474757582560602,
      "Crooked Stave Artisan Beer Project" => 115432685183200,
      "Beryl's Beer Co." => 581084931958881,
      "Blue Moon Brewing Company" => 204659979096,
      "The ChopHouse & Brewery" => 244557235559933,
      "Breckenridge Brewery" => 122762945301,
      # "C.B. & Potts" => nil,
      "BREW Pub & Kitchen" => 190433961097049,
      "Ouray Brewery" => 117251848291567,
      "The Bakers' Brewery" => 255590967948474,
      "Vindication Brewing Co" => 557956054232129,
      "Broken Plow Brewery" => 318365888290700,
      "Big B's Fabulous Juices & Hard Ciders" =>159552413422,
      "Rock Bottom Restaurant & Brewery Denver" => 141783095978222,
      "Rock Bottom Restaurant & Brewery South Denver" => 120821171264431,
      "Rock Bottom Restaurant & Brewery The Orchard" => 371962482873035,
      "Castle Rock Beer Co." => 910107625708377,
      "Dodgeton Creek Brewing Company" => 453109611415989,
      "Steamworks Brewing Company" =>94220748178,
      "Kannah Creek Brewing Company" => 268397425044,
      "Kannah Creek Brewing Company West" => 1732160613665412,
      "Echo Brewing Company" => 219375674769228,
      "Evergreen Tap House" => 468192706719035,
      "Upslope Brewing Company" => 76835986834,
      "Front Range Brewing Company" => 432408006831201,
      "Goldspot Brewing Company" => 451746571614278,
      "Grand Lake Brewing Company" => 297442290339797,
      "Halfpenny Brewing Company" => 596131100498889,
      "Hogshead Brewery" => 212796235504037,
      "Colorado Mountain Brewery" => 469049913127447,
      "Jessup Farm Barrel House" => 1027187643982175,
      "Caution Brewing Company" => 268880119832,
      "Mountain Sun Brewery" => 21383762515,
      "Lowdown Brewery + Kitchen" => 456826637744688,
      "Station 26 Brewing Co." => 468810763214714,
      "Elk Mountain Brewing" => 127417533961385,
      "Bierstadt Lagerhaus" => 1378445749083049,
      "Call To Arms Brewing Company" => 354985434644199,
      "Brix Taphouse & Brewery" => 536043609861416,
      "Tivoli Brewing" => 487101954634437,
      "BierWerks Brewery" => 142612389084872,
      "Open Door Brewing Company" => 181736298541870,
      "Soul Squared Brewing Company" => 471016856396309,
      "Tommyknocker Brewery" => 38856529042,
      "Joyride Brewing Company" => 240916426052936,
      "Very Nice Brewing Company" => 302979766406555,
      "Living The Dream Brewing Co." => 548033041906551,
      "Saint Patrick's Brewing Company" => 480878738611126,
      "12Degree Brewing" => 217053491702271,
      "Great Storm Brewing" => 194072563976168,
      "PDub" => 1597764033837346,
      "Barrels & Bottles Brewery" => 115988165095315,
      "Grimm Brothers Brewhouse" => 123645906186,
      "Two22 Brew" => 170112319851846,
      "Big Beaver Brewing Company" => 158406647530168,
      "Redstone Meadery" => 183840711658160,
      "Buckhorn Brewers llc" => 290054361070987,
      "4 Noses Brewing Company" => 486174691472742,
      "Crow Hop Brewing Co" => 165143837009093,
      "BRU" => 334842226532886,
      "Animas Brewing Company" => 584559258326613,
      "Equinox Brewing Company" => 142203398777,
      "Odell Brewing Company" => 14729295602,
      "Colorado Cider Company" => 129158170495975,
      "Renegade Brewing Company" => 170790099616701,
      "Odd13 Brewing" => 517669254921688,
      "Ute Pass Brewing Company" => 273930169405637,
      "C Squared Ciders" => 1542476916001938,
      "Someplace Else Brewery" => 1607141896272796,
      "Estes Park Brewery" => 782503898476502,
      "Verboten Brewing" => 153180484800419,
      "Banded Oak Brewing Co." => 581555421994105,
      "The Industrial Revolution Brewing Company" => 134896366720647,
      "Briar Common Brewery" => 596433993841984,
      "Revolution Brewing Co" => 50761040890,
      "Southern Sun Pub and Brewery" => 120934591253847,
      "Bristol Brewing Company" => 31651662505,
      "New Image Brewing Company" => 691905564288480,
      "Westfax Brewing Company" => 266861010172241,
      "TRiNiTY Brewing" => 88679883986,
      "Dry Dock Brewing Company" => 98902488741,
      "Elevation Beer Company" => 151790678251578,
      "Loveland Aleworks" => 196112463792000,
      "City Star Brewing Company" => 238590389534854,
      "Odyssey Beerwerks" => 441747809187289,
      "Riff Raff Brewing" => 395246747195407,
      "Holidaily Brewing Company" => 1574869812760485,
      "CooperSmith's Pub & Brewing" => 160052399640,
      "TRVE Brewing Company" => 176147312421870,
      "Nighthawk Brewery" => 142286185978146,
      "Westminster Brewing Co" => 156361874531731,
      "Bonfire Brewing" => 123287344368666,
      "Wild Cider" => 551562524916122,
      "Copper Kettle Brewing Company" => 134249499948221,
      "Copper Club Brewing Company" => 270293926410645,
      "Periodic Brewing" => 797974790246748,
      "De Steeg Brewing" => 450996104922766,
      "Smiling Toad Brewery"=> 469337909818051,
      "Spangalang Brewery" => 1498716697044419,
      "Black Shirt Brewing Company" => 326186471775,
      "Blue Spruce Brewing"=> 216882605127174,
      "Black Sky Brewery" => 1410136072540723,
      "3 Freaks Brewery" => 609692705715297,
      "Rockslide Brewing Co" => 349727326832,
      "Twisted Pine Brewing Company" => 155284002641,
      "Capitol Creek Brewery" => 1652081241775908,
      "Rocky Mountain Brewery" => 286486084873298,
      "Chain Reaction Brewing Company" => 126822754167159,
      "El Rancho Brewing" => 370433963144808,
      "Local Relic Brewing" => 1478412915709704,
      "Crestone Brewing Company" => 1713511142239988,
      "Rockyard Brewing Company" => 66914143376,
      "Crabtree Brewing Company" => 173082785978,
      "FATE Brewing Company" => 168531613282978,
      "Amicas Pizza, Microbrews and More" => 177810042248760,
      "Gilded Goat Brewing Company" => 917715361607919,
      "Crazy Mountain Brewing Denver"=> 598582807017574,
      "Crazy Cherry"=> 1595741520467673,
      "Crazy Edwards" => 1539801752715444,
      "Cannonball Creek Brewing Company" => 234862203302217,
      "Golden Block" => 716474548410727,
      "Resolute Brewing Company" => 489801797836682,
      "The Eldo Brewery & Taproom" => 731268800266735,
      "Oskar Blues Brewery" => 281725950993,
      "Nano 108 Brewing Company" => 574712975933430,
      "Snowbank Brewing" => 1509506315952624,
      "Storybook Brewing" => 535789979855023,
      "Ratio Beerworks" => 292922367564921,
      "Red Mountain Brewing" => 113586805936045,
      "VisionQuest" => 1434605056839464,
      "Crystal Springs Brewing Co" => 373653759464,
      "Floodstage Ale Works" => 307439812735490,
      "Moonlight Pizza & Brewpub" => 120154605275,
      "Zuni Street Brewing Company" => 235258596860508,
      "Strange Craft Beer Company" => 122368966742,
      "Hideaway Park Brewery" => 575773905832113,
      "Mash Lab Brewing" => 280354325680771,
      "Pagosa Brewing & Grill" => 66719310787,
      "Dad & Dude's Breweria" => 103961466326688,
      # "Moffat Station" => 124449017640900,
      "Palisade Brewing Company" => 113124425395872,
      "Asher Brewing Company" => 165171255714,
      "Grossen Bart Brewery" => 302248493215675,
      "Yampa Valley Brewing Company" => 1382228728666301,
      "Aspen Brewing Company" => 41950633367,
      "Mahogany Ridge Brewery & Grill" => 254180038068608,
      "Sanitas Brewing" => 356014481103622,
      "Beer By Design Brewery" => 161868590592091,
      "Bull & Bush Pub & Brewery" => 113516875349638,
      "Little Machine Beer" => 1538809436399446,
      "Mountain Toad Brewing" => 201445813323279,
      "Brewability Lab" => 1696975927223836,
      "San Luis Valley Brewing Co" => 145366725561589,
      "Fieldhouse Brewing Company" => 179923458750449,
      "14er Brewing Company" => 424693641072323,
      "Butcherknife Brewing Company" => 201294169889505,
      "Fossil Craft Beer Company" => 450729271670729,
      "Lariat Lodge Brewing Co." => 1527541127526529,
      "Bootstrap Brewing Company Niwot" => 186161878551264,
      "Bootstrap Brewing Company Longmont" => 384426805261090,
      # "SandLot Brewery at Coors Field" => 121599011184103,
      "Manitou Brewing Company" => 498853596817196,
      "Left Hand Brewing Company" => 55803895115,
      "Climb Hard Cider" => 329878417191187,
      "Cogstone Brewing Company"=> 301649423331390,
      "Backcountry Brewery" => 310570202232,
      "Big Thompson Brewery" => 148579128671779,
      "Locavore Beer Works" => 538721986213191,
      "High Alpine Brewing Co." => 468119786632655,
      "Spice Trade Brewing" => 199210850553320,
      "Diebolt Brewing Company" => 394486740593465,
      "Dead Hippie Brewing" => 1534679833469304,
      "River North Brewery" => 194134343972747,
      "High Hops Brewery" => 184964611589590,
      "Boulder Beer Company"=> 37004902662,
      "105 West Brewing Co." => 1381306125528527,
      "Phantom Canyon Brewing Company" => 35874977761,
      "Liquid Mechanics Brewing Co." => 232941493581262,
      "Cheluna Brewing" => 754864984624908,
      "Factotum Brewhouse" => 555303017848535,
      "Acidulous Brewing Company" => 566412943530520,
      "Telluride Brewing Company" => 116054948474913,
      "Brewery Rickoli" => 278677935489255,
      "Grandma's House" => 464647150263276,
      "Pikes Peak Brewing Company" => 129542297100060,
      "Deep Draft Brewery" => 1405406283091288,
      "Funkwerks" => 141759402511941,
      "Platt Park Brewing Co." => 593673387358694,
      "Barnett & Son Brewing Co." => 446369955446933,
      "Horsefly Brewing Co" => 403909493064318,
      "Pint's Pub Brewery and Freehouse" => 120511017966391,
      "Casey Brewing & Blending" => 625431407499930,
      "Carbondale Beer Works" => 416023025077,
      "Dillon Dam Brewery" => 136833181819,
      "Intersect Brewing" => 998643300164825,
      "Great Frontier Brewing Company" => 481159778635485,
      "JAKs Brewing" => 712711518818878,
      "SKEYE Brewing" => 1491395817740087,
      "Goed Zuur" => 146618799157889,
      "Our Mutual Friend Malt & Brew" => 305105296227231,
      "Ursula brewery" => 967861846617130,
      "Vail Brewing Company" => 1429160087373843,
      "Old Colorado Brewing" => 342853129258477,
      "Carver Brewing Company" => 44302005221,
      "Cerebral Brewing" => 206004412887014,
      "Dolores River Brewery" => 53830103585,
      "Launch Pad Brewery" => 652007311524494,
      "Intrepid Sojourner Beer Project" => 1752357968331920,
      "Red Leg Brewing Company" => 290972717668895,
      "Suds Brothers Brewery" => 318191508270122,
      "Dostal Alley Brewpub & Casino" => 363384231069,
      # "Shine Brewing Company" => 459106734289220,
      "Gold Camp Brewing Company" => 914106935272322,
      "Wibby Brewing" => 741607399195545,
      "Denver Beer Company" => 172134696162075,
      "Alpine Dog Brewing Company" => 297964156923085,
      "Storm Peak Brewing Company" => 343323392367959,
      "Lone Tree Brewing Company" => 177815808942333,
      "38 State Brewing Company" => 263440157064408,
      "Shamrock Brewing Company" => 64528277385,
      "New Belgium Brewing" => 209783682775802,
      "Maxline Brewing" => 363222790421492,
      "Glenwood Canyon BrewPub" => 206865365686,
      "Berthoud Brewing Company" => 535217079831143,
      "Walter's Beer" => 457967974322762,
      "Declaration Brewing Company" => 249821078383292,
      "Prost Brewing Company" => 237687729624109,
      "Lumpy Ridge Brewery" => 1089274831088903,
      "Jagged Mountain Brewery" => 311175085620387,
      "Golden City Brewery" => 58264581513,
      "James Peak Brewery & Smokehouse" => 1011266975649441,
      "Rock Cut Brewing Company" => 108235112844883,
      "Broken Compass Brewing" => 635654253140323,
      "Two Rascals Brewing Company" => 286162451445656,
      "Wiley Brewing Company" => 199565041665,
      "Berthound Brewing Co" => 535217079831143,
      "Durango Brewing Company" => 161122639726,
      "Wonderland Brewing Company" => 121885344651503,
      "Ironworks Brewery and Pub" => 100883299956223,
      "Zwei Brewing Co" => 573855592691656,
      "Great Divide Brewing Company" => 65369839606,
      "Finkel & Garf Brewing Co." => 467408753390251,
      "Rails End Beer Company" => 1146654622032980,
      "Westbound & Down Brewery" => 1435849990050974,
      "Gore Range Brewery" => 155764744452275,
      "Wit's End Brewing Company" => 162524563767537,
      "J. Fargo`s Family Dining / Coyote J Brewing Co" => 109166949113874,
      "FERMÆNTRA" => 508207712550679,
      "Horse & Dragon Brewing Company" => 337309593054355,
      "Pug Ryan's Brewing Company" => 116170079399,
      "Eddyline Restaurant and Brewing Company" => 121546885371,
      "Pumphouse Brewery & Restaurant" => 53250989836,
      "The Post Brewing Co." => 150084751822285,
      "Comrade Brewing Company" => 180710748644512,
      "The Brew on Broadway" => 400863759950349,
      "Gravity Brewing" => 158988250809784,
      "Ska Brewing Company" => 161243029138,
      "Three Barrel Brewing Company" => 156395814396891,
      "Roaring Fork Beer Company" => 603647589656318,
      "Grist Brewing Company Lone Tree" => 1690170954612734,
      "Grist Brewing Company Highland Ranch" => 1368554183222059,
      "J Wells Brewery" => 100118656781098,
      "300 Suns Brewing" => 144618558888749,
      "Iron Bird Brewing Co" => 267647186727527,
      "Bruz Beers" => 1584819208468836,
      "Wynkoop Brewing Company" => 326039410764756,
      "Kokopelli Beer Company" => 205526139545473,
      "Boggy Draw Brewery" => 761847547170749,
      "Black Project Spontaneous & Wild Ales" => 260118237522965,
      "Smugglers Brew Pub" => 493464004021892,
      "7 Hermits Brewing Company" => 526527484057790,
      "Black Bottle Brewery" => 310064465691842,
      "Colorado Plus" => 544424812256892,
      "McClellan's Brewing Company" => 950748821655306,
      "Vine Street Pub & Brewery" => 29328243280,
      "Snow Capped Cider" => 710328862334740,
      "St. Vrain Cidery" => 439820542851667,
      "Cellar West Artisan Ales" => 1783142708581223,
      "Green Mountain Beer Company" => 517991658299279,
      "Lady Justice Brewing" => 160886494073911,
      "Landlocked Ales" => 411480058933705,
      "Peak to Peak Tap & Brew" => 300491986797436,
      "Happy Leaf Kombucha" => 314261582026663,
      "Colorado Boy Pizzeria & Brewery" => 185627951589097,
      "New Terrain Brewing Company" => 699653496805544,
      "Mountain Tap Brewery" => 734051433393187,
      "Cerberus Brewing" => 1675403189346403,
      "Wolfe Brewing Company" => 584357718322184,
      "Mockery Brewing Co." => 469751406415935,
      "Mother Tucker Brewery" => 1498216250419209,
      "Pateros Creek Brewing Company" => 193988121344,
      "Powder Keg Brewing" => 434288353351563,
      "Fiction Beer Company" => 179258682275582,
      "Stem Ciders" => 478851138802210,
      "Outer Range Brewing Co." => 1755749124667830,
      "EPIC Brewing Company" => 399696610085099,
      "Big Choice Brewing" => 119035291530631,
      "WeldWerks Brewing Co" => 447933885339603,
      "West Flanders Brewing Co." => 343712809037994,
      "Wild Woods Brewery" => 281478828618033,
      "Zephyr Brewing Co" => 612432528777314,
      # "Gunbarrel Brewing CO" => 414035545366325
    }
  end

  def destroy_data
    # Brewery.destroy_all
  end

  # def populate_breweries
  #   CSV.foreach("./db/data/breweries.csv", :headers => true) do |row|
  #     Brewery.create!(row.to_hash)
  #   end
  #   puts "Breweries Successfully Seeded"
  # end

  def populate_breweries
    @breweries.each do |brewery, id|
      response = Faraday.get("https://graph.facebook.com/v2.10/#{id}?fields=about%2Ccover%2Cdescription%2Cemails%2Cfounded%2Cgeneral_info%2Chours%2Clocation%2Cphone%2Cname%2Cwebsite&access_token=#{@token}")
      parsed = JSON.parse(response.body, symbolize_names: true)
      # Brewery.find_or_create_by([{
      # brewery = Brewery.find_by(fb_id: parsed[:id])
      # brewery.update_attributes(
      Brewery.create(
                     name:        parsed[:name],
                     fb_id:       parsed[:id],
                     phone:       parsed[:phone],
                     address:     parsed[:location][:street],
                     city:        parsed[:location][:city],
                     state:       parsed[:location][:state],
                     email:       parsed[:location][:email],
                     about:       parsed[:about],
                     description: parsed[:description],
                     photo:       parsed[:cover][:source],
                     url:         parsed[:website],
                     zip_code:    parsed[:location][:zip]
                     )
        # brewery.save
      puts "created #{parsed[:name]} brewery!"
    end
    puts "brewery seed complete!"
  end
end

Seed.start
