class Plan
  include ActiveModel::Validations
  include ActiveModel::Conversion
    extend ActiveModel::Naming

  attr_accessor :city, :state, :miles, :content, :raw_data, :forecast

  validates :city, presence: true, length: { minimum: 3 }
  validates :state, presence: true, length: { minimum: 2 }
  validates :miles, presence: true, numericality: true, numericality: { :less_than_or_equal_to => 50 }

  def initialize(attributes = {})
    @forecast = ""
    @dining_places  = ""
    @mapping = Hash.new
      attributes.each do |key, value|
        if key == "city" then
          @city = value
        elsif key == "state" then
          @state = value
        elsif key == "miles" then
          @miles = value
        end
      end


  end

  def data
      w_api = Wunderground.new("16fe19f7186ebdb3")
      @state = @state.strip
      @city = @city.strip
      return w_api.conditions_for(@state, @city)
  end

  def restaurants (lat, long)
    # Yelp.client.configure do |config|
    #   config.consumer_key = "YxyK8voSlq8Ow45sgOY_Ng"
    #   config.consumer_secret = "t6s50K7dG6j7JIO-BvJA6nGAF7A"
    #   config.token = "rmRh1Z-YOXgy5MMauGEy5Im74eP3BRGU"
    #   config.token_secret = "CNzTV8vJe4GZb75gGJ0iPEBKe3k"
    # end

    dist  = @miles.to_f * 1609.34
    client = Yelp::Client.new({ consumer_key: "YxyK8voSlq8Ow45sgOY_Ng",
                            consumer_secret: "t6s50K7dG6j7JIO-BvJA6nGAF7A",
                            token: "rmRh1Z-YOXgy5MMauGEy5Im74eP3BRGU",
                            token_secret: "CNzTV8vJe4GZb75gGJ0iPEBKe3k"
                          })

      # Search radius in meters
      params = { term: 'food',
        limit: 5,
        sort: 2,
        actionlinks: 'true',
        radius_filter:  dist

      }

      locale = { lang: 'en' }

      # coordinates
      coordinates = { latitude: lat, longitude: long }

      # response = Yelp.client.search('San Francisco', params, locale)
      begin
        response  =  client.search_by_coordinates(coordinates, params, locale)
        # puts response.inspect
        # puts response.businesses
        # puts response.total
        # puts response.businesses.size
        # puts response.businesses[0].name
        # puts response.businesses[0].image_url
        # puts response.businesses[0].url
        # puts response.businesses[0].snippet_text
        # puts response.businesses[0].reservation_url
        # puts response.businesses[0].eat24_url
      rescue
        response  = ""
      end
      return response
    end

  def persisted?
      false
  end

  def places_to_visit (lat, long)
    client = GooglePlaces::Client.new("AIzaSyDWWnecYAnYFWxosxnZmmkc6SVyyCqD7IA")

    dist  = @miles.to_f * 1609.34
    response = client.spots(lat, long, :radius => dist, :types => ['church', 'park', 'museum', 'amusement_park', 'aquarium', 'art_gallery', 'bowling_alley', 'city_hall', 'casino', 'zoo'], :exclude => ['spa', 'hospital', 'car_wash', 'car_repair', 'car_rental', 'lodging', 'subway_station', 'train_station', 'transit_station', 'travel_agency', 'taxi_stand', 'bus_station', 'grocery_or_supermarket', 'department_store', 'shoe_store', 'jewelry_store', 'restaurant'])
    detailed_response = Array.new
    if !response.blank? then
      response.sort_by{|a| a.rating}.reverse
      if response.length > 5
        response[0..4].each do |place|
          spot = client.spot(place.reference)
          detailed_response.push(spot)
          # google_places_hash[place.name] = {:lat => place.lat, :long => place.lng}
        end
      else response.each do |place|
          spot = client.spot(place.reference)
          detailed_response.push(spot)
          # google_places_hash[place.name] = {:lat => place.lat, :long => place.lng}
        end
      end
    end

    # detailed_response = client.spot(response[0].reference)
    # return_value = Hash.new
    # return_value['places'] = detailed_response
    # return_value['hash'] = google_places_hash
    return detailed_response
    # return Array.new
  end

end
