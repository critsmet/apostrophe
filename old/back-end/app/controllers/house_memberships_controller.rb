class HouseMembershipsController < ApplicationController

  def create
    @house_membership = HouseMembership.new(membership_params)
    if @house_membership.save
      redirect_to user_path(membership_params[:user_id])
    else
      redirect_to zine_path(membership_params[:zine_id])
    end
  end

  private

  def membership_params
    params.require(:house_membership).permit(:user_id, :house_id)
  end


end
