class LabsController < ApplicationController
  def index
    @lab = Lab.all
  end

  def new
    @lab =Lab.new
  end

  def show
    @lab = Lab.find(params[:id])
  end

end
