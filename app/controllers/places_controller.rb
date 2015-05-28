class PlacesController < ApplicationController

	def index
		@places = Place.all.order(:name)
	end

	#view is a FORM
	def new
		@place = Place.new 
	end

	#view is a FORM
	def edit
      	@place = Place.find(params[:id])
    end

    #view is the object that you created
    #posts to database
    #redirects to show page, where the model is
	def create
      @place = Place.new(place_params)

      if @place.save
        redirect_to @place #(dont have to do place_path(@place)... ruby will guess for you)
      else
        render :new
      end
	end

	#updates database and redirects to show page
	def update
    	@place = Place.find(params[:id])

      	if @place.update(place_params)
        	redirect_to @place
     	else
        	render :edit
      	end
    end

	#new is to create as edit is to update

	def show
		@place = Place.find(params[:id])
	end

	def destroy
		@place = Place.find(params[:id])

		@place.destroy
		redirect_to places_path
	end
	
	private

		def place_params
			params.require(:place).permit(:name, :address)
		end

end
