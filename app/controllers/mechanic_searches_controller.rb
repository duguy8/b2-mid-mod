class MechanicSearchesController < ApplicationController
  def show
    @mechanic = Mechanic.find(params[:id])
    @mechanic.add_ride(params[:search])

    redirect_to mechanic_path(@mechanic.id)
  end
end
