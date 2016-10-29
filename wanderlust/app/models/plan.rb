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
  		#@forecast = w_api.conditions_for("pa","philadelphia")
  		#@forecast = w_api.conditions_for(@state, @city)
  		return w_api.conditions_for(@state, @city)
  	end

  	def persisted?
    	false
  	end
end
