class LocationsController < ApplicationController
  def index
    @locations = Location.all
    flash[:error] = 'No hay lugares registrados aun' if @locations.empty?
    @hash = Gmaps4rails.build_markers(@locations) do |location, marker|
      marker.lat location.location_latitude
      marker.lng location.location_longitude
    end
  end

  def new
    @location = Location.new
  end

  def create
    @location = Location.new(location_params)
    if @location.save
      flash[:success] = 'Lugar agregado con éxito'
      redirect_to locations_path
    else
      flash[:error] = @location.errors.full_messages.join(',')
      render 'new'
    end
  end

  def location_params
    params.require(:location).permit(:id, :name, :latitude, :longitude, :address, :max_slots, :description)
  end
  private :location_params
end
