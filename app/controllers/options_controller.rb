class OptionsController < ApplicationController
	before_action :get_option, only: [:edit, :update, :destroy]
	def get_option
		@option = Option.find(params[:id])
	end
	def index
		@options = Option.all
	end

	def show
		@oneOption = Option.find(params[:id])
	end 

	def new
		@option = Option.new
	end

	def create 
		@option = Option.create!(options_params)
		redirect_to options_path(@option)
	end 

	def edit 
	end 

	def update 
		3.times do
			@option.update_attributes!(options_params)
		end
		redirect_to options_path(@option)
	end 

	def destroy
		@option.destroy
		redirect_to options_path
	end 

	private

	def options_params
		params.require(:option).permit(:label, :value, :question_id)
	end 

end

