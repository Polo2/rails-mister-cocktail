class DosesController < ApplicationController
before_action :find_cocktail, only: [:new, :create]

  def index

  end

  def show

  end

  def destroy
    @dose = Dose.find(params[:id])
    @dose.destroy
    redirect_to cocktails_path
  end

  def new
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new
  end

  def create
    @dose = Dose.new(doses_params)
    @dose.cocktail = @cocktail

    if @dose.save
      redirect_to cocktail_dose_path(@dose)
    else
      render :new
    end

  end

  private

  def doses_params
    params.require(:dose).permit(:description, :cocktail)
  end

  def find_cocktail
    @cocktail = Cocktail.find(params[:cocktail_id])
  end

  def edit
  end

  def update
  end

end
