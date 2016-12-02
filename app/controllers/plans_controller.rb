class PlansController < ApplicationController
	 before_filter :authenticate_user!
	
	def show
		@plan = Plan.new(params.require(:plan).permit(:city,:state,:miles))
		# @plan.forecast = @plan.data
		# if @plan.forecast.has_key? "current_observation" then
		# 	lat  =  @plan.forecast["current_observation"]["display_location"]["latitude"]
		# 	long =  @plan.forecast["current_observation"]["display_location"]["longitude"]
		# 	@plan.dining_places = @plan.restaurants(lat, long)
		# 	if @plan.dining_places == "" then
		# 		@plan.dining_places = "No restaurants nearby"
		# 	end
		# end
		
	end

	def new 
		@plan = Plan.new
	end

	def index
		@plan = Plan.new
		redirect_to new_plan_path
	end

	def create
		# render plain: params[:plan].inspect
		@plan = Plan.new(params.require(:plan).permit(:city,:state,:miles))
		if @plan.valid?
			render "show"
		else
			# render :action => 'new'
			render 'new'
		end
	end
end
