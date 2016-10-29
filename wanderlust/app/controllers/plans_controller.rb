class PlansController < ApplicationController
	def show
		@plan = Plan.new(params.require(:plan).permit(:city,:state,:miles))
		# @plan.data
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
