class PlannersController < ApplicationController

	def show
		@planner = Planner.new(params.require(:planner).permit(:city,:state,:miles))
		@planner.data
	end

	def new 
		@planner = Planner.new
	end

	def create
		# render plain: params[:planner].inspect
		@planner = Planner.new(params.require(:planner).permit(:city,:state,:miles))
		if @planner.valid?
			# puts "as"
			# TODO i need to display the resultsnw
			#write buiness logic in the model class
			render "show"
		else
			# render :action => 'new'
			render 'new'
		end
	end
end
