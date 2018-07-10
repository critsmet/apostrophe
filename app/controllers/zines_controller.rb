class ZinesController < ApplicationController
before_action :authenticate_user!, only: [:new]

  def index
    @zines = Zine.all
  end

  def show
    set_magazine
  end

  def new
    @zine = Zine.new
  end

  def create
    @zine = Zine.new(zine_params)
    create_publication
    if @zine.valid_attribute?(:name) && @publication.valid?
      save_and_assign
      redirect_to zine_path(@zine)
    else
      render :new
    end
  end

  private

  def create_publication
    if publication_params[:publisher_id] == ""
      @publication = current_user.publications.new
    else
      house = House.find(publication_params[:publisher_id])
      @publication = house.publications.new
    end
  end

  def publication_params
    params.require(:publication).permit(:publisher_id)
  end

  def save_and_assign
    @publication.save
    @zine.publication_id = @publication.id
    @zine.save
  end

  def set_magazine
    @zine = Zine.find(params[:id])
  end

  def zine_params
    params.require(:zine).permit(:name)
  end


end
