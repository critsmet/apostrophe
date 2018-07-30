class UsersController < ApplicationController
  before_action :set_user, only: [:show, :upload_photo, :update]

  def show
  end

  def upload_photo
  end

  def update
    if @user.update(user_params)
      redirect_to @user
    else
      render :upload_photo
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:mainphoto)
  end

end
