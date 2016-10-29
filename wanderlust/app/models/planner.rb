# require 'wunderground'

class Planner 
	include ActiveModel::Validations
	include ActiveModel::Conversion
  	extend ActiveModel::Naming

	attr_accessor :city, :state, :miles, :content, :raw_data, :forecast

	validates_presence_of :city, presence: true, length: { minimum: 3 }
	validates_presence_of :state, presence: true, length: { minimum: 1 }
	validates_presence_of :miles, presence: true, :maximum => 2, numericality: true, inclusion: { in: 0..9 }

	def initialize(attributes = {})
		@forecast = ""
    	attributes.each do |key, value|
    		if key == "city" then
    			@city = value
    		elsif key == "miles" then
    			@miles = value
    		end
    	end
  	end

  	def data
  		w_api = Wunderground.new("16fe19f7186ebdb3")
  		@state = @state.chop.strip
  		@city = @city.chop.strip
  		# forecast = w_api.conditions_for("pa","philadelphia")
  		@forecast = w_api.conditions_for(@state, @city)
  		return @forecast
  	end

  	def persisted?
    	false
  	end
end
