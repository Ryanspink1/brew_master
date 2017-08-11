require 'csv'

class Seed

  def self.start
    seed = Seed.new
    # seed.destroy_data
    # seed.populate_breweries
    seed.get_events
  end

#   def initialize
#     @breweries = {
#   "Avalanche Brewing Co" => 36572226900,
#   "Avery Brewing Company" => 129355431997,
#   "Baere Brewing Company" => 474757582560602,
#   "Crooked Stave Artisan Beer Project" => 115432685183200,
#   "Beryl's Beer Co." => 581084931958881,
#   "Blue Moon Brewing Company" => 204659979096,
#   "The ChopHouse & Brewery" => 244557235559933,
#   "Breckenridge Brewery" => 122762945301,
#   # "C.B. & Potts" => nil,
#   "BREW Pub & Kitchen" => 190433961097049,
#   "Ouray Brewery" => 117251848291567,
#   "The Bakers' Brewery" => 255590967948474,
#   "Vindication Brewing Co" => 557956054232129,
#   "Broken Plow Brewery" => 318365888290700,
#   "Big B's Fabulous Juices & Hard Ciders" =>159552413422,
#   "Rock Bottom Restaurant & Brewery Denver" => 141783095978222,
#   "Rock Bottom Restaurant & Brewery South Denver" => 120821171264431,
#   "Rock Bottom Restaurant & Brewery The Orchard" => 371962482873035,
#   "Castle Rock Beer Co." => 910107625708377,
#   "Dodgeton Creek Brewing Company" => 453109611415989,
#   "Steamworks Brewing Company" =>94220748178,
#   "Kannah Creek Brewing Company" => 268397425044,
#   "Kannah Creek Brewing Company West" => 1732160613665412,
#   "Echo Brewing Company" => 219375674769228,
#   "Evergreen Tap House" => 468192706719035,
#   "Upslope Brewing Company" => 76835986834,
#   "Front Range Brewing Company" => 432408006831201,
#   "Goldspot Brewing Company" => 451746571614278,
#   "Grand Lake Brewing Company" => 297442290339797,
#   "Halfpenny Brewing Company" => 596131100498889,
#   "Hogshead Brewery" => 212796235504037,
#   "Colorado Mountain Brewery" => 469049913127447,
#   "Jessup Farm Barrel House" => 1027187643982175,
#   "Caution Brewing Company" => 268880119832,
#   "Mountain Sun Brewery" => 21383762515,
#   "Lowdown Brewery + Kitchen" => 456826637744688,
#   "Station 26 Brewing Co." => 468810763214714,
#   "Elk Mountain Brewing" => 127417533961385,
#   "Bierstadt Lagerhaus" => 1378445749083049,
#   "Call To Arms Brewing Company" => 354985434644199,
#   "Brix Taphouse & Brewery" => 536043609861416,
#   "Tivoli Brewing" => 487101954634437,
#   "BierWerks Brewery" => 142612389084872,
#   "Open Door Brewing Company" => 181736298541870,
#   "Soul Squared Brewing Company" => 471016856396309,
#   "Tommyknocker Brewery" => 38856529042,
#   "Joyride Brewing Company" => 240916426052936,
#   "Very Nice Brewing Company" => 302979766406555,
#   "Living The Dream Brewing Co." => 548033041906551,
#   "Saint Patrick's Brewing Company" => 480878738611126,
#   "12Degree Brewing" => 217053491702271,
#   "Great Storm Brewing" => 194072563976168,
#   "PDub" => 1597764033837346,
#   "Barrels & Bottles Brewery" => 115988165095315,
#   "Grimm Brothers Brewhouse" => 123645906186,
#   "Two22 Brew" => 170112319851846,
#   "Big Beaver Brewing Company" => 158406647530168,
#   "Redstone Meadery" => 183840711658160,
#   "Buckhorn Brewers llc" => 290054361070987,
#   "4 Noses Brewing Company" => 486174691472742,
#   "Crow Hop Brewing Co" => 165143837009093,
#   "BRU" => 334842226532886,
#   "Animas Brewing Company" => 584559258326613,
#   "Equinox Brewing Company" => 142203398777,
#   "Odell Brewing Company" => 14729295602,
#   "Colorado Cider Company" => 129158170495975,
#   "Renegade Brewing Company" => 170790099616701,
#   "Odd13 Brewing" => 517669254921688,
#   "Ute Pass Brewing Company" => 273930169405637,
#   "C Squared Ciders" => 1542476916001938,
#   "Someplace Else Brewery" => 1607141896272796,
#   "Estes Park Brewery" => 782503898476502,
#   "Verboten Brewing" => 153180484800419,
#   "Banded Oak Brewing Co." => 581555421994105,
#   "The Industrial Revolution Brewing Company" => 134896366720647,
#   "Briar Common Brewery" => 596433993841984,
#   "Revolution Brewing Co" => 50761040890,
#   "Southern Sun Pub and Brewery" => 120934591253847,
#   "Bristol Brewing Company" => 31651662505,
#   "New Image Brewing Company" => 691905564288480,
#   "Westfax Brewing Company" => 266861010172241,
#   "TRiNiTY Brewing" => 88679883986,
#   "Dry Dock Brewing Company" => 98902488741,
#   "Elevation Beer Company" => 151790678251578,
#   "Loveland Aleworks" => 196112463792000,
#   "City Star Brewing Company" => 238590389534854,
#   "Odyssey Beerwerks" => 441747809187289,
#   "Riff Raff Brewing" => 395246747195407,
#   "Holidaily Brewing Company" => 1574869812760485,
#   "CooperSmith's Pub & Brewing" => 160052399640,
#   "TRVE Brewing Company" => 176147312421870,
#   "Nighthawk Brewery" => 142286185978146,
#   "Westminster Brewing Co" => 156361874531731,
#   "Bonfire Brewing" => 123287344368666,
#   "Wild Cider" => 551562524916122,
#   "Copper Kettle Brewing Company" => 134249499948221,
#   "Copper Club Brewing Company" => 270293926410645,
#   "Periodic Brewing" => 797974790246748,
#   "De Steeg Brewing" => 450996104922766,
#   "Smiling Toad Brewery"=> 469337909818051,
#   "Spangalang Brewery" => 1498716697044419,
#   "Black Shirt Brewing Company" => 326186471775,
#   "Blue Spruce Brewing"=> 216882605127174,
#   "Black Sky Brewery" => 1410136072540723,
#   "3 Freaks Brewery" => 609692705715297,
#   "Rockslide Brewing Co" => 349727326832,
#   "Twisted Pine Brewing Company" => 155284002641,
#   "Capitol Creek Brewery" => 1652081241775908,
#   "Rocky Mountain Brewery" => 286486084873298,
#   "Chain Reaction Brewing Company" => 126822754167159,
#   "El Rancho Brewing" => 370433963144808,
#   "Local Relic Brewing" => 1478412915709704,
#   "Crestone Brewing Company" => 1713511142239988,
#   "Rockyard Brewing Company" => 66914143376,
#   "Crabtree Brewing Company" => 173082785978,
#   "FATE Brewing Company" => 168531613282978,
#   "Amicas Pizza, Microbrews and More" => 177810042248760,
#   "Gilded Goat Brewing Company" => 917715361607919,
#   "Crazy Mountain Brewing Denver"=> 598582807017574,
#   "Crazy Cherry"=> 1595741520467673,
#   "Crazy Edwards" => 1539801752715444,
#   "Cannonball Creek Brewing Company" => 234862203302217,
#   "Golden Block" => 716474548410727,
#   "Resolute Brewing Company" => 489801797836682,
#   "The Eldo Brewery & Taproom" => 731268800266735,
#   "Oskar Blues Brewery" => 281725950993,
#   "Nano 108 Brewing Company" => 574712975933430,
#   "Snowbank Brewing" => 1509506315952624,
#   "Storybook Brewing" => 535789979855023,
#   "Ratio Beerworks" => 292922367564921,
#   "Red Mountain Brewing" => 113586805936045,
#   "VisionQuest" => 1434605056839464,
#   "Crystal Springs Brewing Co" => 373653759464,
#   "Floodstage Ale Works" => 307439812735490,
#   "Moonlight Pizza & Brewpub" => 120154605275,
#   "Zuni Street Brewing Company" => 235258596860508,
#   "Strange Craft Beer Company" => 122368966742,
#   "Hideaway Park Brewery" => 575773905832113,
#   "Mash Lab Brewing" => 280354325680771,
#   "Pagosa Brewing & Grill" => 66719310787,
#   "Dad & Dude's Breweria" => 103961466326688,
#   # "Moffat Station" => 124449017640900,
#   "Palisade Brewing Company" => 113124425395872,
#   "Asher Brewing Company" => 165171255714,
#   "Grossen Bart Brewery" => 302248493215675,
#   "Yampa Valley Brewing Company" => 1382228728666301,
#   "Aspen Brewing Company" => 41950633367,
#   "Mahogany Ridge Brewery & Grill" => 254180038068608,
#   "Sanitas Brewing" => 356014481103622,
#   "Beer By Design Brewery" => 161868590592091,
#   "Bull & Bush Pub & Brewery" => 113516875349638,
#   "Little Machine Beer" => 1538809436399446,
#   "Mountain Toad Brewing" => 201445813323279,
#   "Brewability Lab" => 1696975927223836,
#   "San Luis Valley Brewing Co" => 145366725561589,
#   "Fieldhouse Brewing Company" => 179923458750449,
#   "14er Brewing Company" => 424693641072323,
#   "Butcherknife Brewing Company" => 201294169889505,
#   "Fossil Craft Beer Company" => 450729271670729,
#   "Lariat Lodge Brewing Co." => 1527541127526529,
#   "Bootstrap Brewing Company Niwot" => 186161878551264,
#   "Bootstrap Brewing Company Longmont" => 384426805261090,
#   # "SandLot Brewery at Coors Field" => 121599011184103,
#   "Manitou Brewing Company" => 498853596817196,
#   "Left Hand Brewing Company" => 55803895115,
#   "Climb Hard Cider" => 329878417191187,
#   "Cogstone Brewing Company"=> 301649423331390,
#   "Backcountry Brewery" => 310570202232,
#   "Big Thompson Brewery" => 148579128671779,
#   "Locavore Beer Works" => 538721986213191,
#   "High Alpine Brewing Co." => 468119786632655,
#   "Spice Trade Brewing" => 199210850553320,
#   "Diebolt Brewing Company" => 394486740593465,
#   "Dead Hippie Brewing" => 1534679833469304,
#   "River North Brewery" => 194134343972747,
#   "High Hops Brewery" => 184964611589590,
#   "Boulder Beer Company"=> 37004902662,
#   "105 West Brewing Co." => 1381306125528527,
#   "Phantom Canyon Brewing Company" => 35874977761,
#   "Liquid Mechanics Brewing Co." => 232941493581262,
#   "Cheluna Brewing" => 754864984624908,
#   "Factotum Brewhouse" => 555303017848535,
#   "Acidulous Brewing Company" => 566412943530520,
#   "Telluride Brewing Company" => 116054948474913,
#   "Brewery Rickoli" => 278677935489255,
#   "Grandma's House" => 464647150263276,
#   "Pikes Peak Brewing Company" => 129542297100060,
#   "Deep Draft Brewery" => 1405406283091288,
#   "Funkwerks" => 141759402511941,
#   "Platt Park Brewing Co." => 593673387358694,
#   "Barnett & Son Brewing Co." => 446369955446933,
#   "Horsefly Brewing Co" => 403909493064318,
#   "Pint's Pub Brewery and Freehouse" => 120511017966391,
#   "Casey Brewing & Blending" => 625431407499930,
#   "Carbondale Beer Works" => 416023025077,
#   "Dillon Dam Brewery" => 136833181819,
#   "Intersect Brewing" => 998643300164825,
#   "Great Frontier Brewing Company" => 481159778635485,
#   "JAKs Brewing" => 712711518818878,
#   "SKEYE Brewing" => 1491395817740087,
#   "Goed Zuur" => 146618799157889,
#   "Our Mutual Friend Malt & Brew" => 305105296227231,
#   "Ursula brewery" => 967861846617130,
#   "Vail Brewing Company" => 1429160087373843,
#   "Old Colorado Brewing" => 342853129258477,
#   "Carver Brewing Company" => 44302005221,
#   "Cerebral Brewing" => 206004412887014,
#   "Dolores River Brewery" => 53830103585,
#   "Launch Pad Brewery" => 652007311524494,
#   "Intrepid Sojourner Beer Project" => 1752357968331920,
#   "Red Leg Brewing Company" => 290972717668895,
#   "Suds Brothers Brewery" => 318191508270122,
#   "Dostal Alley Brewpub & Casino" => 363384231069,
#   "Shine Brewing Company" => 459106734289220,
#   "Gold Camp Brewing Company" => 914106935272322,
#   "Wibby Brewing" => 741607399195545,
#   "Denver Beer Company" => 172134696162075,
#   "Alpine Dog Brewing Company" => 297964156923085,
#   "Storm Peak Brewing Company" => 343323392367959,
#   "Lone Tree Brewing Company" => 177815808942333,
#   "38 State Brewing Company" => 263440157064408,
#   "Shamrock Brewing Company" => 64528277385,
#   "New Belgium Brewing" => 209783682775802,
#   "Maxline Brewing" => 363222790421492,
#   "Glenwood Canyon BrewPub" => 206865365686,
#   "Berthoud Brewing Company" => 535217079831143,
#   "Walter's Beer" => 457967974322762,
#   "Declaration Brewing Company" => 249821078383292,
#   "Prost Brewing Company" => 237687729624109,
#   "Lumpy Ridge Brewery" => 1089274831088903,
#   "Jagged Mountain Brewery" => 311175085620387,
#   "Golden City Brewery" => 58264581513,
#   "James Peak Brewery & Smokehouse" => 1011266975649441,
#   "Rock Cut Brewing Company" => 108235112844883,
#   "Broken Compass Brewing" => 635654253140323,
#   "Two Rascals Brewing Company" => 286162451445656,
#   "Wiley Brewing Company" => 199565041665,
#   "Berthound Brewing Co" => 535217079831143,
#   "Durango Brewing Company" => 161122639726,
#   "Wonderland Brewing Company" => 121885344651503,
#   "Ironworks Brewery and Pub" => 100883299956223,
#   "Zwei Brewing Co" => 573855592691656,
#   "Great Divide Brewing Company" => 65369839606,
#   "Finkel & Garf Brewing Co." => 467408753390251,
#   "Rails End Beer Company" => 1146654622032980,
#   "Westbound & Down Brewery" => 1435849990050974,
#   "Gore Range Brewery" => 155764744452275,
#   "Wit's End Brewing Company" => 162524563767537,
#   "J. Fargo`s Family Dining / Coyote J Brewing Co" => 109166949113874,
#   "FERMÆNTRA" => 508207712550679,
#   "Horse & Dragon Brewing Company" => 337309593054355,
#   "Pug Ryan's Brewing Company" => 116170079399,
#   "Eddyline Restaurant and Brewing Company" => 121546885371,
#   "Pumphouse Brewery & Restaurant" => 53250989836,
#   "The Post Brewing Co." => 150084751822285,
#   "Comrade Brewing Company" => 180710748644512,
#   "The Brew on Broadway" => 400863759950349,
#   "Gravity Brewing" => 158988250809784,
#   "Ska Brewing Company" => 161243029138,
#   "Three Barrel Brewing Company" => 156395814396891,
#   "Roaring Fork Beer Company" => 603647589656318,
#   "Grist Brewing Company Lone Tree" => 1690170954612734,
#   "Grist Brewing Company Highland Ranch" => 1368554183222059,
#   "J Wells Brewery" => 100118656781098,
#   "300 Suns Brewing" => 144618558888749,
#   "Iron Bird Brewing Co" => 267647186727527,
#   "Bruz Beers" => 1584819208468836,
#   "Wynkoop Brewing Company" => 326039410764756,
#   "Kokopelli Beer Company" => 205526139545473,
#   "Boggy Draw Brewery" => 761847547170749,
#   "Black Project Spontaneous & Wild Ales" => 260118237522965,
#   "Smugglers Brew Pub" => 493464004021892,
#   "7 Hermits Brewing Company" => 526527484057790,
#   "Black Bottle Brewery" => 310064465691842,
#   "Colorado Plus" => 544424812256892,
#   "McClellan's Brewing Company" => 950748821655306,
#   "Vine Street Pub & Brewery" => 29328243280,
#   "Snow Capped Cider" => 710328862334740,
#   "St. Vrain Cidery" => 439820542851667,
#   "Cellar West Artisan Ales" => 1783142708581223,
#   "Green Mountain Beer Company" => 517991658299279,
#   "Lady Justice Brewing" => 160886494073911,
#   "Landlocked Ales" => 411480058933705,
#   "Peak to Peak Tap & Brew" => 300491986797436,
#   "Happy Leaf Kombucha" => 314261582026663,
#   "Colorado Boy Pizzeria & Brewery" => 185627951589097,
#   "New Terrain Brewing Company" => 699653496805544,
#   "Mountain Tap Brewery" => 734051433393187,
#   "Cerberus Brewing" => 1675403189346403,
#   "Wolfe Brewing Company" => 584357718322184,
#   "Mockery Brewing Co." => 469751406415935,
#   "Mother Tucker Brewery" => 1498216250419209,
#   "Pateros Creek Brewing Company" => 193988121344,
#   "Powder Keg Brewing" => 434288353351563,
#   "Fiction Beer Company" => 179258682275582,
#   "Stem Ciders" => 478851138802210,
#   "Outer Range Brewing Co." => 1755749124667830,
#   "EPIC Brewing Company" => 399696610085099,
#   "Big Choice Brewing" => 119035291530631,
#   "WeldWerks Brewing Co" => 447933885339603,
#   "West Flanders Brewing Co." => 343712809037994,
#   "Wild Woods Brewery" => 281478828618033,
#   "Zephyr Brewing Co" => 612432528777314}
# end
#
#   def destroy_data
#     Brewery.destroy_all
#   end
#
#   # def populate_breweries
#   #   Brewery.create([{
#   #     name: "Cerebral Brewing",
#   #     owner:"Sean Buchan, Chris WashenBerger, Dan McGuire",
#   #     address: "1477 Monroe St",
#   #     city: "Denver",
#   #     state: "Colorado",
#   #     description:"Cerebral Brewing is a neighborhood brewery in the Bluebird District of Denver, Colorado. Our goal is to combine scientific methodology with an artistic viewpoint to create extremely drinkable beers spanning a broad spectrum of styles.",
#   #     creation_date: "2013/01/01",
#   #     url: "http://cerebralbrewing.com/"
#   #     }])
#   #
#   #     puts "Breweries Successfully Seeded"
#   # end
#   #
#   # def populate_breweries
#   #   CSV.foreach("./db/data/breweries.csv", :headers => true) do |row|
#   #     Brewery.create!(row.to_hash)
#   #   end
#   #   puts "Breweries Successfully Seeded"
#   # end
#
#
#
#   def populate_breweries
#     @breweries.each do |brewery, id|
#       response = Faraday.get("https://graph.facebook.com/v2.10/#{id}?fields=about%2Ccover%2Cdescription%2Cemails%2Cfounded%2Cgeneral_info%2Chours%2Clocation%2Cphone%2Cname%2Cwebsite&access_token=EAACS5p8zSNkBAMnNsEjrlnCikqPCV0ctmKkFz9cCY5paSQeu5Kms9jTYDlTP4fVWqvSopaxMid8w9PkZAtXCQ6O0wLPqkoXvcZA4UPgVtCA9Acp5CNehkLyIRq4qyfka9uRZCZACCQdd9NkTRNlHjTFwJEne1VwCsZCuFrOlsRAfJSZBq9ZAQrPnQHUuy8tVRBYHwdhaFjgtAZDZD")
#       parsed = JSON.parse(response.body, symbolize_names: true)
#       Brewery.create([{
#                      name:        parsed[:name],
#                      fb_id:       parsed[:id],
#                      phone:       parsed[:phone],
#                      address:     parsed[:location][:street],
#                      city:        parsed[:location][:city],
#                      state:       parsed[:location][:state],
#                      email:       parsed[:location][:email],
#                      about:       parsed[:about],
#                      description: parsed[:description],
#                      photo:       parsed[:cover][:source],
#                      url:         parsed[:website]
#                      }])
#       puts "created #{parsed[:name]} brewery!"
#     end
#     puts "brewery seed complete!"
#   end
def initialize
@parsed = {
  "data": [
    {
      "id": "100922390501246",
      "cover": {
        "offset_x": 0,
        "offset_y": 43,
        "source": "https://scontent.xx.fbcdn.net/v/t1.0-9/s720x720/18664262_1489671464410942_6937347544519825712_n.png?oh=367b88d00f299eedd67da653fe698df8&oe=5A328D6B",
        "id": "1489671464410942"
      },
      "description": "The ninth edition of the Denver Rare Beer Tasting will take place on Oct. 6, during the GABF weekend. More than 50 of America's top craft breweries will be serving rare, exotic and vintage beers to raise funds for the Pints for Prostates campaign. Tickets for the event go on sale on Father's Day, June 18th at 10 a.m. (MT).",
      "start_time": "2017-10-06T12:00:00-0600",
      "end_time": "2017-10-06T16:00:00-0600",
      "name": "Denver Rare Beer Tasting IX",
      "place": {
        "name": "McNichols Building",
        "location": {
          "city": "Denver",
          "country": "United States",
          "latitude": 39.739749410397,
          "longitude": -104.98959985015,
          "state": "CO",
          "street": "144 W Colfax Ave",
          "zip": "80202"
        },
        "id": "115910688566623"
      }
    },
    {
      "id": "1732100200153488",
      "cover": {
        "offset_x": 0,
        "offset_y": 50,
        "source": "https://scontent.xx.fbcdn.net/v/t1.0-9/q82/p720x720/20479931_820722501431097_6054222872851539913_n.jpg?oh=76069421b1d0db39f110e28e700c8ee9&oe=59F64D2F",
        "id": "820722501431097"
      },
      "start_time": "2017-08-24T16:00:00-0600",
      "end_time": "2017-08-24T21:00:00-0600",
      "name": "Cerebral Brewing",
      "place": {
        "name": "Cerebral Brewing",
        "location": {
          "city": "Denver",
          "country": "United States",
          "latitude": 39.7396393,
          "longitude": -104.9451828,
          "state": "CO",
          "street": "1477 Monroe St",
          "zip": "80206"
        },
        "id": "206004412887014"
      }
    },
    {
      "id": "441363219596796",
      "cover": {
        "offset_x": 61,
        "offset_y": 0,
        "source": "https://scontent.xx.fbcdn.net/v/t31.0-8/s720x720/20645355_934884456665669_3840603686091756926_o.jpg?oh=197463ff2ffcb140fd69aefc5d595e4c&oe=59EEF5D1",
        "id": "934884456665669"
      },
      "description": "Join us for the re-release of our GABF silver medal winning beer that we brewed with our friends at Our Mutual Friend Brewery.

Dreamy Thing is a Dry Hopped Brettanomyces Saison brewed with Colorado wheat and hopped with Citra, Centennial and Sterling. Fermented with a house blend of Brettanomyces strains in stainless for over 2 months and then bottle conditioned for an additional 3 months.

Coming in at 6.9%, Dreamy Thing is just that. Notes of overripe pineapple, apricot, gooseberries followed by a clean dry finish.

Available in 500 ml bottle. $12/bottle and limit 3 per person. No crowlers. We will also have a very limited amount on tap until it runs out. 10oz pours only. Dreamy Thing will also be available on draft and in bottles at Our Mutual Friend Brewery.",
      "start_time": "2017-08-18T12:00:00-0600",
      "end_time": "2017-08-18T23:00:00-0600",
      "name": "Dreamy Thing Release",
      "place": {
        "name": "Cerebral Brewing",
        "location": {
          "city": "Denver",
          "country": "United States",
          "latitude": 39.7396393,
          "longitude": -104.9451828,
          "state": "CO",
          "street": "1477 Monroe St",
          "zip": "80206"
        },
        "id": "206004412887014"
      }
    },
    {
      "id": "433230537077694",
      "cover": {
        "offset_x": 0,
        "offset_y": 45,
        "source": "https://scontent.xx.fbcdn.net/v/t31.0-8/s720x720/20616777_842395859248318_591449394833850455_o.jpg?oh=dcfddd729f30e91db029615f7880e3ab&oe=5A253EA1",
        "id": "842395859248318"
      },
      "description": "Cerebral Brewing Pint Night starting @ 6PM. Come try 2 of their beers on tap. Trust me, they're delicious. See you then",
      "start_time": "2017-08-12T18:00:00-0600",
      "end_time": "2017-08-12T21:00:00-0600",
      "name": "Cerebral Pint Night",
      "place": {
        "name": "Twenty Brew TapHouse",
        "location": {
          "city": "Westminster",
          "country": "United States",
          "latitude": 39.8988495,
          "longitude": -105.0536575,
          "state": "CO",
          "street": "11187 Sheridan Blvd, # 10",
          "zip": "80020"
        },
        "id": "361043784050197"
      }
    },
    {
      "id": "822594064580444",
      "cover": {
        "offset_x": 0,
        "offset_y": 53,
        "source": "https://scontent.xx.fbcdn.net/v/t31.0-8/s720x720/20543937_931144740372974_1876711753442198536_o.jpg?oh=b2615ba1b2141c3203f14fbbfbbd647d&oe=5A347887",
        "id": "931144740372974"
      },
      "description": "She's baaaaaack! Yes, we're talking about DDH Rare Trait 🙌🏻.

We took our house IPA and doubled the dry-hop rate to 7#/bbl with Citra, El Dorado, Azacca and Mosaic. It tastes even better than it sounds with notes of overripe peaches, mango, guava and passion fruit.

We will be releasing a limited amount of crowlers starting on Friday, August 11th until they run out. $16/ crowler and limit 3 per person. Once these are gone we will not be selling any crowlers of DDH Rare Trait  until the next time we bring it back. It will also be available on tap.

Basecamp Provisions will be out front starting at 3pm serving up delicous bowls, burritos, and homemade cookies until 10pm.",
      "start_time": "2017-08-11T12:00:00-0600",
      "end_time": "2017-08-13T22:00:00-0600",
      "name": "DDH Rare Trait Crowler Release",
      "place": {
        "name": "Cerebral Brewing",
        "location": {
          "city": "Denver",
          "country": "United States",
          "latitude": 39.7396393,
          "longitude": -104.9451828,
          "state": "CO",
          "street": "1477 Monroe St",
          "zip": "80206"
        },
        "id": "206004412887014"
      }
    },
    {
      "id": "217055998820143",
      "cover": {
        "offset_x": 0,
        "offset_y": 50,
        "source": "https://scontent.xx.fbcdn.net/v/t1.0-9/q82/p720x720/20526141_820717374764943_3087163405844918545_n.jpg?oh=b57d3c8fcfdf6c04e6df63aabd1957ae&oe=5A2717D7",
        "id": "820717374764943"
      },
      "description": "We're back!!!!   Come and let us feed you.",
      "start_time": "2017-08-10T16:00:00-0600",
      "end_time": "2017-08-10T21:00:00-0600",
      "name": "Cerebral Brewing - Colfax & Monroe",
      "place": {
        "name": "Cerebral Brewing",
        "location": {
          "city": "Denver",
          "country": "United States",
          "latitude": 39.7396393,
          "longitude": -104.9451828,
          "state": "CO",
          "street": "1477 Monroe St",
          "zip": "80206"
        },
        "id": "206004412887014"
      }
    },
    {
      "id": "1959721304283583",
      "cover": {
        "offset_x": 0,
        "offset_y": 0,
        "source": "https://scontent.xx.fbcdn.net/v/t31.0-8/s720x720/20507747_930218657132249_1520950828321186580_o.jpg?oh=afd0e87ccd5b6d869631ff68c1db2dac&oe=59F11869",
        "id": "930218657132249"
      },
      "description": "We are proudly hosting a monthly gathering for budding neuroscientists and for those who just love to talk science!

This month's meetup will be held on Wednesday, 8/9 from 7-9pm in the taproom. There will even be an interactive experiment for those who want to do some active science!

Rock N Lobster Roll will be out front serving up delicious lobster tacos + more starting at 4pm.",
      "start_time": "2017-08-09T19:00:00-0600",
      "end_time": "2017-08-09T21:00:00-0600",
      "name": "NeuroNight!",
      "place": {
        "name": "Cerebral Brewing",
        "location": {
          "city": "Denver",
          "country": "United States",
          "latitude": 39.7396393,
          "longitude": -104.9451828,
          "state": "CO",
          "street": "1477 Monroe St",
          "zip": "80206"
        },
        "id": "206004412887014"
      }
    },
    {
      "id": "1910210415862377",
      "cover": {
        "offset_x": 0,
        "offset_y": 53,
        "source": "https://scontent.xx.fbcdn.net/v/t31.0-8/s720x720/20507652_930218327132282_2652703962210999948_o.jpg?oh=e4fec11db911dd3e4bcb18b071464b3b&oe=5A269344",
        "id": "930218327132282"
      },
      "description": "Join us for the re-release of one of our favorite IPAs to date, Cheat Code. Recently placing in DRAFT Magazine's '50 Best IPAs in America' we thought we'd bring it back for a limited time. We feel this batch is head and shoulders above the previous version and can't wait for you to judge for yourselves.

Heavily hopped with some of our favorite intensely fruity hops - Galaxy, El Dorado, Mosaic, and South African N1/69. Coming in at 7.2% with notes of grapefruit, melon, guava and a hint of pineapple.

It will be on tap, but we will only be releasing 200 Crowlers starting on Friday, August 4th until they run out. $14/crowler and limit 3 per person. Once these are gone we will not be selling any crowlers of Cheat Code until the next time we bring it back.

Basecamp Provisions will be outside from 3-10pm serving up their delicious bowls, burritos and homemade cookies.",
      "start_time": "2017-08-04T12:00:00-0600",
      "end_time": "2017-08-04T23:00:00-0600",
      "name": "Cheat Code Crowler Release",
      "place": {
        "name": "Cerebral Brewing",
        "location": {
          "city": "Denver",
          "country": "United States",
          "latitude": 39.7396393,
          "longitude": -104.9451828,
          "state": "CO",
          "street": "1477 Monroe St",
          "zip": "80206"
        },
        "id": "206004412887014"
      }
    },
    {
      "id": "1612973808776551",
      "cover": {
        "offset_x": 0,
        "offset_y": 50,
        "source": "https://scontent.xx.fbcdn.net/v/t1.0-9/p720x720/20430148_1946085268996727_4599574189837509157_n.jpg?oh=5e8364dc5d4a62c7826228d33ac2e89b&oe=5A27EF7D",
        "id": "1946085268996727"
      },
      "description": "Troubadour Maltings is bringing some fine fermented friends from Denver to The Forge along with the wheels of steel and the good times too. Come enjoy beers from TRVE Brewing, Cerebral Brewing, and Goldspot Brewing Company all brewed with tasty Troubadour malts, grown and malted right here in Northern CO",
      "start_time": "2017-08-03T18:30:00-0600",
      "end_time": "2017-08-03T22:00:00-0600",
      "name": "Troubadour At The Forge",
      "place": {
        "name": "The Forge Publick House",
        "location": {
          "city": "Fort Collins",
          "country": "United States",
          "latitude": 40.588901117328,
          "longitude": -105.07546023944,
          "state": "CO",
          "street": "255 Old Firehouse Alley",
          "zip": "80524"
        },
        "id": "157694907631144"
      }
    },
    {
      "id": "687059401484050",
      "cover": {
        "offset_x": 0,
        "offset_y": 50,
        "source": "https://scontent.xx.fbcdn.net/v/t1.0-9/p720x720/20429794_1089116974523859_7553942206785618718_n.jpg?oh=9935dc7dc75a9ab0e4d66b4bdeb6ed4a&oe=5A28986A",
        "id": "1089116974523859"
      },
      "description": "Happier Hours by the Passport Program is a celebration of Colorado's amazing breweries. Grab your besties and enjoy some craft beers!

Ticket Purchase Includes:
- 3 drink tickets redeemable during the event (5pm to 9pm) for Cerebral core beers
- A 2017 Summer Denver Passport

Note: Drink tickets can only be redeemed if a wrist band and a drink ticket are presented to the bar staff during the hours of the event.",
      "start_time": "2017-08-03T17:00:00-0600",
      "end_time": "2017-08-03T21:00:00-0600",
      "name": "Happier Hours: Cerebral Brewing",
      "place": {
        "name": "Cerebral Brewing",
        "location": {
          "city": "Denver",
          "country": "United States",
          "latitude": 39.7396393,
          "longitude": -104.9451828,
          "state": "CO",
          "street": "1477 Monroe St",
          "zip": "80206"
        },
        "id": "206004412887014"
      }
    },
    {
      "id": "1505677216156152",
      "cover": {
        "offset_x": 0,
        "offset_y": 50,
        "source": "https://scontent.xx.fbcdn.net/v/t1.0-9/s720x720/20264866_143570982891340_2001533226175934084_n.jpg?oh=26131bbc82c5e62be72b7aaba88752ba&oe=59EB2AA8",
        "id": "143570982891340"
      },
      "description": "We're back! Green Chile Bacon Cheeseburgers, Lumpia, Tacos, Chicken Adobo - the good stuff. More details as the date nears..",
      "start_time": "2017-07-30T12:30:00-0600",
      "end_time": "2017-07-30T20:00:00-0600",
      "name": "Adobo Food Truck at Cerebral Brewing",
      "place": {
        "name": "Cerebral Brewing",
        "location": {
          "city": "Denver",
          "country": "United States",
          "latitude": 39.7396393,
          "longitude": -104.9451828,
          "state": "CO",
          "street": "1477 Monroe St",
          "zip": "80206"
        },
        "id": "206004412887014"
      }
    },
    {
      "id": "1961598424116888",
      "cover": {
        "offset_x": 0,
        "offset_y": 50,
        "source": "https://scontent.xx.fbcdn.net/v/t31.0-8/s720x720/20248326_1355995951164565_6742665373964865998_o.jpg?oh=abd438da0400febcdb2411860b9f4cfd&oe=5A35031E",
        "id": "1355995951164565"
      },
      "description": "We've had a great run serving up some awesome beers all July long from Cerebral Brewing and Fiction Beer Company over at Jake's Other Half, but all good things must come to an end.

Before we turn the page, it's time for a proper send off and Sami from Cerebral Brewing and Ryan from Fiction Beer Company will be joining us as we go out in style.  We'll kick things off around 6 and go till 9, Sami's celebrating her birthday weekend and both Cerebral and Fiction will be giving out brewery glasses and raffling off some schwag.

If you haven't made it out this month to get a taste of these two fine Colfax breweries, now you've got an excuse.  Friday, July 28th, 6pm-9pm...see you there!",
      "start_time": "2017-07-28T18:00:00-0600",
      "end_time": "2017-07-28T21:00:00-0600",
      "name": "July Tap Takeover Send Off with Cerebral and Fiction!",
      "place": {
        "name": "Jakes Brew Bar",
        "location": {
          "city": "Littleton",
          "country": "United States",
          "latitude": 39.61346,
          "longitude": -105.01767,
          "state": "CO",
          "street": "2530 W Main St",
          "zip": "80120"
        },
        "id": "250004271763744"
      }
    },
    {
      "id": "1680160295380375",
      "cover": {
        "offset_x": 0,
        "offset_y": 0,
        "source": "https://scontent.xx.fbcdn.net/v/t1.0-9/19989268_1054049468059507_8202823782571723546_n.jpg?oh=92147e7611a78e6d34e6b8265621141e&oe=5A31A43B",
        "id": "1054049468059507"
      },
      "description": "Tasty Colfax is a restaurant and pub crawl through the eclectic business, entertainment, and arts districts on Colfax Ave between York and Colorado Blvd.

This event features numerous district eateries, showcasing their delectables, ranging from Thai food to the best biscuits in Denver.

The extended block party fuses urban energy with small town community, and includes live street music, fine and urban art all along your favorite main street, Colfax Avenue.

Tuesday, July 25th, 2017 5:30PM – 8:30PM",
      "start_time": "2017-07-25T17:30:00-0600",
      "end_time": "2017-07-25T20:30:00-0600",
      "name": "Tasty Colfax Restaurant Tour Colfax",
      "place": {
        "name": "Bluebird Business Improvement District"
      }
    },
    {
      "id": "1385474291541635",
      "cover": {
        "offset_x": 0,
        "offset_y": 50,
        "source": "https://scontent.xx.fbcdn.net/v/t31.0-8/s720x720/18815343_1701642969863519_8286494974985624969_o.jpg?oh=393127cee26c5bc584b5493c536981f7&oe=59F730D9",
        "id": "1701642969863519"
      },
      "description": "Come enjoy pours from 30 of your favorite local breweries and wineries at #DCF2017. We're hosting three hours of sampling creative craft brews and grape blends. As an added bonus, the \"people's choice\" beer will be on tap at next year's fair!

     - $10 + grounds admission ticket
     - must be 21+ to purchase

Check out all the stellar breweries attending the DCF Beer & Wine Fest presented by Anthony's Pizza & Pasta:

Big Choice Brewing
Bootstrap Brewing Company
Boulder Beer Co.
Brewability Lab
Bruz Beers
Cerebral Brewing
Crooked Stave Artisan Beer Project
Declaration Brewing
Diebolt Brewing Company
Durango Brewing Company
Fate Brewing Co.
Finkel & Garf Brewing Co.
Großen Bart Brewery
Jagged Mountain Craft Brewery
Kokopelli Beer Company
Lady Justice Brewing
Lone Tree Brewing Company
Nighthawk Brewery
Odell Brewing Co
Odyssey Beerwerks
Oskar Blues Brewery
Our Mutual Friend Brewery
Peak to Peak Tap & Brew
Pikes Peak Brewing
Sandlot Brewery
Telluride Brewing Co.
Tivoli Brewing Co
Verboten Brewing
Vindication Brewing Co.
Westminster Brewing Co
Wibby Brewing
Wonderland Brewing Company
Wynkoop Brewing Co.",
      "start_time": "2017-07-22T16:00:00-0600",
      "end_time": "2017-07-22T19:00:00-0600",
      "name": "DCF Beer & Wine Fest presented by Anthony's Pizza & Pasta",
      "place": {
        "name": "Denver County Fair",
        "location": {
          "city": "Denver",
          "country": "United States",
          "latitude": 39.7811499,
          "longitude": -104.9713699,
          "state": "CO",
          "street": "4655 Humboldt St",
          "zip": "80216"
        },
        "id": "144967205531111"
      }
    },
    {
      "id": "1372222922855402",
      "cover": {
        "offset_x": 0,
        "offset_y": 0,
        "source": "https://scontent.xx.fbcdn.net/v/t31.0-8/s720x720/18699362_10154758985322545_5045564009403487292_o.jpg?oh=5d082982265fb6e90b38ae9c20057bf4&oe=5A2A19E1",
        "id": "10154758985322545"
      },
      "description": "After eight years of his flagship event, Kyle’s Brew Fest, Kyle Hollingsworth returns this summer with his charity beer festival and concert to benefit Conscious Alliance in Denver, CO, on July 20th, as the Official Pre-Party to The String Cheese Incident’s three-night run at Red Rocks Amphitheatre.

On Thursday, July 20th, at Great Divide Brewing Company’s RiNo Location in Denver, CO, Kyle Hollingsworth Band and other very special friends will treat fans to a beer festival and pre-party to Red Rocks, plus a selection of more than 60 craft beers from more than 30 breweries.

The event will also feature exclusive collaboration brews from Kyle and select breweries, combined with food pairings for the first time ever. For another first, VIP tickets are also available providing fans early entry, tasting with Kyle, private brewery tour with Kyle, signed Red Rocks poster and more!

21+

3403 Brighton Blvd

Denver, CO 80216",
      "start_time": "2017-07-20T17:00:00-0600",
      "end_time": "2017-07-20T21:00:00-0600",
      "name": "Kyle's Brew Fest",
      "place": {
        "name": "Great Divide Barrel Bar",
        "location": {
          "city": "Denver",
          "country": "United States",
          "latitude": 39.7703433,
          "longitude": -104.9791827,
          "state": "CO",
          "street": "1812 35th St",
          "zip": "80216"
        },
        "id": "537781519703413"
      }
    },
    {
      "id": "1338186526289313",
      "cover": {
        "offset_x": 0,
        "offset_y": 50,
        "source": "https://scontent.xx.fbcdn.net/v/t31.0-8/s720x720/19983915_918075598346555_3262700351283055537_o.jpg?oh=f83f9999210f3de3b9f12381f4c47f2c&oe=59EBB147",
        "id": "918075598346555"
      },
      "description": "Come join us this Saturday, July 15th for The Robot Uprising.

Doors open at noon and we will have 50 cases of Robot Librarian, our collaborative DIPA with Odd 13, Weldworks and Fiction to sell.  $11/ 4-pack. Limit 1/2 case per person. Robot Librarian will be available on tap, but not in crowlers to-go. 4-Packs to-go only.

We will also be releasing Destruct Sequence, a one-off of our beloved Rare Trait. This 6.4% IPA has the same base as Rare Trait, but is dry-hopped with loads of Vic Secret, Idaho 7 and Cashmere.

We will be selling Destruct Sequence on tap as well as crowlers to-go. $14/crowler and limit 3 per person. Crowlers will be available at the same table as the 4-packs. See you on Saturday!",
      "start_time": "2017-07-15T12:00:00-0600",
      "end_time": "2017-07-15T23:00:00-0600",
      "name": "Robot Uprising Release at Cerebral",
      "place": {
        "name": "Cerebral Brewing",
        "location": {
          "city": "Denver",
          "country": "United States",
          "latitude": 39.7396393,
          "longitude": -104.9451828,
          "state": "CO",
          "street": "1477 Monroe St",
          "zip": "80206"
        },
        "id": "206004412887014"
      }
    },
    {
      "id": "452740445098237",
      "cover": {
        "offset_x": 0,
        "offset_y": 68,
        "source": "https://scontent.xx.fbcdn.net/v/t31.0-8/s720x720/19679467_1512209802134290_2458244703395451809_o.jpg?oh=8b2f78f9e8c3d5905afb0d0691a25bbc&oe=59EFF31D",
        "id": "1512209802134290"
      },
      "description": "Robot Librarian (a collab DIPA) is back, and this time, he isn't alone! On Saturday, July 15th, we will release Robot Librarian in cans and on draft, but keep reading....it gets even better!

Each of the breweries involved in the collab (Cerebral Brewing, Fiction Beer Co & Weldwerks Brewing), brewed a Robot themed beer, and each of those beers will also be on tap! Keep an eye out on social media for more details on the Robot themed beers coming soon.

Robot Librarian cans: $11/4pk. 2 case max per customer.

Doors open at noon.

Robot Librarian will not hit distro, at all.",
      "start_time": "2017-07-15T12:00:00-0600",
      "end_time": "2017-07-15T23:00:00-0600",
      "name": "Robot Uprising Release Party",
      "place": {
        "name": "Odd13 Brewing",
        "location": {
          "city": "Lafayette",
          "country": "United States",
          "latitude": 39.9983649,
          "longitude": -105.0878412,
          "state": "CO",
          "street": "301 E Simpson St",
          "zip": "80026"
        },
        "id": "517669254921688"
      }
    },
    {
      "id": "492198724449505",
      "cover": {
        "offset_x": 0,
        "offset_y": 66,
        "source": "https://scontent.xx.fbcdn.net/v/t31.0-8/s720x720/19702819_1675826195778624_6114939811422407004_o.jpg?oh=a6e26bf4fd8aa1ed5591466bc69055c1&oe=59F43535",
        "id": "1675826195778624"
      },
      "description": "\"Beer is too vast a medium to be approached thoughtlessly.\" Cerebral Brewing right here in Denver is coming over and taking over our taps. Come try some of these local craft beers with us! (Also, can we talk about how cool these names are?)
Tap list:
Rare Trait--IPA
Strange Claw--IPA
Tandem Jetpack--Double IPA
Local Traffic Only--Saison",
      "start_time": "2017-07-13T17:00:00-0600",
      "end_time": "2017-07-13T22:00:00-0600",
      "name": "Cerebral Brewing tap takeover!",
      "place": {
        "name": "Fire on the Mountain Buffalo Wings - Denver",
        "location": {
          "city": "Denver",
          "country": "United States",
          "latitude": 39.7623,
          "longitude": -105.03721,
          "state": "CO",
          "street": "3801 W 32nd Ave",
          "zip": "80211"
        },
        "id": "313406458687278"
      }
    },
    {
      "id": "685460968314624",
      "cover": {
        "offset_x": 50,
        "offset_y": 0,
        "source": "https://scontent.xx.fbcdn.net/v/t1.0-9/s720x720/19665372_913941668759948_4983506235836181916_n.jpg?oh=c2b39005752530e3aa0511455cc0f974&oe=59EDE3B8",
        "id": "913941668759948"
      },
      "description": "Come join us every Tuesday for a bluegrass pick hosted by Meadow Mountain. The band will play from 7-7:30pm and then musicians of all levels will be welcome to join in at 7:30p.m.


Basecamp Provisions will be out front slingin' their delicious bowls until 9pm and The Humble Pie Store will be right down the hall dishing out their sweet and savory pies!",
      "start_time": "2017-07-11T19:00:00-0600",
      "end_time": "2017-09-26T22:00:00-0600",
      "name": "Bluegrass Tuesdays with Meadow Mountain",
      "place": {
        "name": "Cerebral Brewing",
        "location": {
          "city": "Denver",
          "country": "United States",
          "latitude": 39.7396393,
          "longitude": -104.9451828,
          "state": "CO",
          "street": "1477 Monroe St",
          "zip": "80206"
        },
        "id": "206004412887014"
      }
    },
    {
      "id": "1688620004772673",
      "cover": {
        "offset_x": 111,
        "offset_y": 0,
        "source": "https://scontent.xx.fbcdn.net/v/t1.0-0/p240x240/18341783_10155298520079184_7762152139558508601_n.jpg?oh=facaa90382750cfadb7ffbaa8d2d4fb1&oe=59EB7D0D",
        "id": "10155298520079184"
      },
      "description": "The 21st Annual Colorado Brewers Rendezvous takes place at Riverside Park in historic downtown Salida, Colorado, surrounded by soaring mountains and hugged by the Arkansas River. You will enjoy live music throughout the event with great food vendors offering up tasty concoctions to pair with your favorite beers! The event features over 75 Colorado Breweries with over 300 samplings of beer offered.

For more information please visit http://www.salidachamber.org.",
      "start_time": "2017-07-08T13:00:00-0600",
      "end_time": "2017-07-08T17:00:00-0600",
      "name": "21st Annual Brewers Rendezvous",
      "place": {
        "name": "Salida, CO",
        "location": {
          "city": "Salida",
          "country": "United States",
          "latitude": 38.5314,
          "longitude": -105.996,
          "state": "CO",
          "zip": "81201, 81227 (PO Box), 81237"
        },
        "id": "112694892078606"
      }
    },
    {
      "id": "1275964175847632",
      "cover": {
        "offset_x": 0,
        "offset_y": 32,
        "source": "https://scontent.xx.fbcdn.net/v/t1.0-9/s720x720/18425558_1817752588544866_261170818196038675_n.jpg?oh=828956908a65b903385d79d569b05c03&oe=5A2931DC",
        "id": "1817752588544866"
      },
      "description": "One-day brewfest in beautiful Riverside Park in downtown Salida. Sample the different and unique beers by specialty craft brewers from around Colorado.",
      "start_time": "2017-07-08T13:00:00-0600",
      "end_time": "2017-07-08T17:00:00-0600",
      "name": "Brewer's Rendezvous",
      "place": {
        "name": "Riverside Park",
        "location": {
          "city": "Salida",
          "country": "United States",
          "latitude": 38.537145595178,
          "longitude": -105.99034336539,
          "state": "CO",
          "zip": "81201"
        },
        "id": "192376564143117"
      }
    },
    {
      "id": "779649475541330",
      "cover": {
        "offset_x": 0,
        "offset_y": 41,
        "source": "https://scontent.xx.fbcdn.net/v/t31.0-8/s720x720/19264555_1326772987441339_3340084941058760437_o.jpg?oh=4db1a2de613e459d7153ca4ca23ca1d9&oe=5A2E4CAD",
        "id": "1326772987441339"
      },
      "description": "Euclid Hall is celebrating #freshtastycraftbeer & the relationships CO craft inspires.  They'll be tapping the SOWN Project beers (featuring local ingredients & the farmer-maltster-brewer collaboration that can happen when we work on our scale).  Come sample the beers made by Cerebral Brewing, Comrade Brewing Company, Our Mutual Friend Brewery, TRVE Brewing, and Horse & Dragon Brewing Company's collab with Soul Squared Brewing Company.  Cheers!",
      "start_time": "2017-07-02T15:00:00-0600",
      "end_time": "2017-07-02T17:00:00-0600",
      "name": "SOWN beers tapping at Euclid Hall Denver",
      "place": {
        "name": "Euclid Hall",
        "location": {
          "city": "Denver",
          "country": "United States",
          "latitude": 39.74773,
          "longitude": -105.00001,
          "state": "CO",
          "street": "1317 14th St",
          "zip": "80202"
        },
        "id": "257884038014"
      }
    },
    {
      "id": "794673000708166",
      "cover": {
        "offset_x": 0,
        "offset_y": 25,
        "source": "https://scontent.xx.fbcdn.net/v/t1.0-9/p720x720/18403651_1819299968390128_548819826114603674_n.jpg?oh=0b0000d7c6ef575b8af809d94371f675&oe=5A268C31",
        "id": "1819299968390128"
      },
      "description": "A craft beer, music, and river festival in Buena Vista, CO. 30+ breweries, live bluegrass music, and some of the views in the state. Presented by The Jailhouse Craft Beer Bar in partnership with the band Rapidgrass and local nonprofit South Main Arts & Parks.",
      "start_time": "2017-07-01T15:00:00-0600",
      "end_time": "2017-07-01T18:00:00-0600",
      "name": "Rapids and Grass Beer Festival",
      "place": {
        "name": "The Jailhouse Craft Beer Bar",
        "location": {
          "city": "Buena Vista",
          "country": "United States",
          "latitude": 38.8430677,
          "longitude": -106.1287314,
          "state": "CO",
          "street": "412 E. Main St",
          "zip": "81211"
        },
        "id": "159525421103327"
      }
    },
    {
      "id": "692434424276072",
      "cover": {
        "offset_x": 0,
        "offset_y": 50,
        "source": "https://scontent.xx.fbcdn.net/v/t31.0-0/p480x480/18738774_10155364496224184_3484051663347839744_o.jpg?oh=bd343bce8b1e06b5f43546831a6aeeee&oe=59F155C7",
        "id": "10155364496224184"
      },
      "description": "Nestled at the foot of the Continental Divide, at 8,000 feet, lies Buena Vista, a town known for its pristine mountain peaks, roaring rapids and adventurous spirit. Take in the sweeping mountain views and the sounds of the river, jam out to amazing live acts featuring Bluegrass, Soul, and Americana, and sample unlimited beer tastings from a variety of esteemed local and out-of-state breweries at Rapids & Grass. The weekend long event starts with free tunes by the river and drinks at The Jailhouse Craft Beer Bar on Friday, June 30th.  The ticketed event starts flowing Saturday with unlimited beer sampling and live music at South Main Square before wrapping up with a float down the Arkansas River on Sunday, July 2nd.

For more information please visit: https://rgfest.com",
      "start_time": "2017-06-30T16:00:00-0600",
      "end_time": "2017-07-02T18:00:00-0600",
      "name": "Rapids & Grass Beer Festival",
      "place": {
        "name": "Buena Vista, CO",
        "location": {
          "city": "Buena Vista",
          "country": "United States",
          "latitude": 38.8388,
          "longitude": -106.133,
          "state": "CO",
          "zip": "81211"
        },
        "id": "106002936098658"
      }
    },
    {
      "id": "1724827231151354",
      "cover": {
        "offset_x": 0,
        "offset_y": 0,
        "source": "https://scontent.xx.fbcdn.net/v/t31.0-0/p180x540/19400227_1879507158958319_2929104744381388697_o.jpg?oh=2fe683bc95f37f438c676127633e51ea&oe=5A2A0C33",
        "id": "1879507158958319"
      },
      "description": "Saturday, June 24th we are hosting our 2nd Anniversary here at The Pint Room in Littleton, CO. Live music will be provided by DJ Moose during the day, and Float Like A Buffalo in the evening. Tons of prizes, games and giveaways will be happening throughout the day, with libations from New Belgium Brewing Cerebral Brewing Jagged Mountain Craft Brewery Good River Beer New Terrain Brewing Co and many more on tap!!",
      "start_time": "2017-06-24T13:00:00-0600",
      "end_time": "2017-06-24T22:00:00-0600",
      "name": "2nd Anniversary Party",
      "place": {
        "name": "The Pint Room - Littleton",
        "location": {
          "city": "Littleton",
          "country": "United States",
          "latitude": 39.623381935736,
          "longitude": -105.0189214949,
          "state": "CO",
          "street": "2620 W Belleview Ave",
          "zip": "80123"
        },
        "id": "1565314733710898"
      }
    }
  ],
  "paging": {
    "cursors": {
      "before": "QVFIUkktUHp6SFRqSExiMkhaQ2F1NG5ld09GNVNFOUpiNkpxcnNLcWhQeU5YSzl4TVlWLVZAtMG51SW1aM0NVcTJ5WFlXZA21hVmlhMWJHcUg3ZAGlZAXzBwRnhB",
      "after": "QVFIUm9sRFFZATzhRYjM2Y2J4SllhblRhSjE5MWcxaUJ4WHJVY1ViTTUtRWZARSnR1THdvLURjcmFuZAWpJanNuNnZARMkxSNS1kaVJzS2FCMm1lY2NQemZAxNnV3"
    },
    "next": "https://graph.facebook.com/v2.10/206004412887014/events?access_token=EAACEdEose0cBAFHyymyR1ZCwoZAXnQH6lPI6OO2Io3zebijgVp6246ZBiUaPAkfkFGXhuon3WrTGcOocyVOfZA8EQSC2Ui3y2aOqJwNY7fob1LVMIVasbq7MmDbiZB487fNwWXXZAGuwWTHS4Y8vTnaVEoW2CTsmR5IEM2VuLjFKWHqA0nNzeCPUy7OjYpuFEZD&pretty=0&fields=id%2Ccover%2Cdescription%2Cstart_time%2Cend_time%2Cname%2Cplace&limit=25&after=QVFIUm9sRFFZATzhRYjM2Y2J4SllhblRhSjE5MWcxaUJ4WHJVY1ViTTUtRWZARSnR1THdvLURjcmFuZAWpJanNuNnZARMkxSNS1kaVJzS2FCMm1lY2NQemZAxNnV3"
  }
}
end

  def get_events
    # Brewery.all.each do |brewery|
      brewery = Brewery.find(588)
      # response = Faraday.get("https://graph.facebook.com/v2.10/#{brewery.fb_id}/events?fields=id%2Ccover%2Cdescription%2Cstart_time%2Cend_time%2Cname%2Cplace&access_token=EAACEdEose0cBAFHyymyR1ZCwoZAXnQH6lPI6OO2Io3zebijgVp6246ZBiUaPAkfkFGXhuon3WrTGcOocyVOfZA8EQSC2Ui3y2aOqJwNY7fob1LVMIVasbq7MmDbiZB487fNwWXXZAGuwWTHS4Y8vTnaVEoW2CTsmR5IEM2VuLjFKWHqA0nNzeCPUy7OjYpuFEZD")
      # parsed = JSON.parse(response.body, symbolize_names: true)
      events = @parsed[:data]
      sanitize_events(brewery, events)


    # end
  end

  def sanitize_events(brewery, events)
    sanitized_events = events.each do |event|
      event[:name] = ""                      if event[:id].nil?
      event[:cover][:source] = ""            if event[:cover][:source].nil?
      event[:description] = ""               if event[:description].nil?
      event[:start_time] = ""                if event[:start_time].nil?
      event[:end_time] = ""                  if event[:end_time].nil?
      event[:place][:name] = ""              if event[:place][:name].nil?
      event[:place][:location] = {:street=>"", :city => "", :state => ""}          if event[:place][:location].nil?
      event[:place][:location][:street] = "" if event[:place][:location][:street].nil?
      event[:place][:location][:city] = ""   if event[:place][:location][:city].nil?
      event[:place][:location][:state] = ""  if event[:place][:location][:state].nil?
    end
    populate_events(brewery, sanitized_events)
  end

  def populate_events(brewery, events)
    events.each do |event|
      brewery.events.find_or_create_by(fb_id:      event[:id],
                                      name:        event[:name],
                                      cover:       event[:cover][:source],
                                      description: event[:description],
                                      start_time:  event[:start_time],
                                      end_time:    event[:end_time],
                                      place:       event[:place][:name],
                                      address:     event[:place][:location][:street],
                                      city:        event[:place][:location][:city],
                                      state:       event[:place][:location][:state])
     puts "created #{event[:name]}!"
    end
  end
end

Seed.start
