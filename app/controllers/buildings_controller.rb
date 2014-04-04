class BuildingsController < ApplicationController

  def index
    @buildings = Building.all

  end

  def new
    @building = Building.new
  end

  def create
    @building = Building.new(building_params)
    if @building.save
      redirect_to root_path, notice: 'You have Successfully Added a Building'
    else
      flash.now[:warning] = 'You were Unsuccessful.'
      render 'new'
    end
  end

  private

  def building_params
    params.require(:building).permit(
      :state, :address, :street, :city, :description, :zip_code, :owner_id
      )
  end

end
