class OwnersController < ApplicationController

  def index
    @owners = Owner.all
  end

  def new
    @owner = Owner.new
  end

  def create
    @owner = Owner.new(owner_params)
    if @owner.save
      redirect_to new_owner_path, notice: 'You have Successfully Added an Owner'
    else
      flash.now[:warning] = 'You were Unsuccessful in Creating an Owner.'
      render 'new'
    end
  end

  def destroy
    @owner = Owner.find(params[:id])


    @owner.delete_buildings if @owner.buildings.count > 0


    @owner.delete
    redirect_to owners_path
  end


  private

  def owner_params
    params.require(:owner).permit(
      :first_name, :last_name, :email, :company
      )
  end


end
