class MechanicsController < ApplicationController
  def index
    @mechanics = Mechanic.all
  end

  def show
    @mechanic = Mechanic.find(params[:id])
    if params[:search]
      @ride = Ride.find(params[:search])
    end
  end
end
