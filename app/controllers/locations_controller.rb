class LocationsController < ApplicationController
  def index
    @locations = Location.all
    flash[:error] = 'No hay lugares registrados aun' if @locations.empty?
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
end
