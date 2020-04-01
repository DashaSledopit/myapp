class LabsController < ApplicationController
  def index
    @lab = Lab.all
  end

  def show
   @lab = Lab.find(params[:id])
  end

  def new
    @lab =Lab.new
  end

  def edit
    @lab = Lab.find(params[:id])
  end

  def create
    @lab = Lab.new(lab_params)
      if @lab.save
        redirect_to @lab, notice: 'Lab was successfully created.' 
      else
        redirect_to new_lab_path
      end
  end

  def update
    @lab = Lab.find_by(id: params[:id])
      if @lab.update_attributes(lab_params)
        redirect_to @lab, notice: 'Lab was successfully updated.'
      else
        render :edit 
      end
  end


  def destroy
    @lab = Lab.find(params[:id])
      if @lab.present?
        @lab.destroy
      end
      redirect_to labs_url, notice: 'Lab was successfully destroyed.' 
  end


  private
    def lab_params
      params.require(:lab).permit(:lab_name, :description, :starting_date)
    end

end
