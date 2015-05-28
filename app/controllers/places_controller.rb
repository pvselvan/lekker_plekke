class PlacesController < ApplicationController

	def index
		@places = Place.all.order(:name)
	end

	def new
		@place = Place.new
	end

	def edit
      	@place = Place.find(params[:id])
    end

	def create
		@place = Place.new(place_params)
		#render plain: params['place'].inspect
		@place.save
		redirect_to @place
	end

	def update
		@place = Place.find(params[:id])

		@place.update
		redirect_to @place
	end

	def show
		@place = Place.find(params[:id])
	end

end
