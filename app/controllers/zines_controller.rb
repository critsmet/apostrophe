class ZinesController < ApplicationController

  def index
    @zines = Zine.all
  end

  def show
    set_magazine
  end

  private
  def set_magazine
    @zine = Zine.find(params[:id])
  end

end
