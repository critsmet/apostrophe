class HousesController < ApplicationController

  def index
    @houses = House.all
  end

  def show
    @house = House.find(params[:id])
  end

  def new
    @house = House.new
  end

  def create
    @house = House.new(house_params)
    @membership = @house.house_memberships.build(user_id: current_user.id)
    if @house.save
      @membership.save
      redirect_to @house
    else
      render :new
    end
  end

  private

  def house_params
    params.require(:house).permit(:name)
  end

end
