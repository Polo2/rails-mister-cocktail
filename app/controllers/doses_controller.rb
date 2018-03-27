class DosesController < ApplicationController
before_action :find_cocktail, only: [:index, :new, :create ]

  def index
    @cocktail = Cocktail.find(params[:cocktail_id])
  end

  def show

  end

  def destroy
    @dose = Dose.find(params[:id])
    @dose.destroy
    redirect_to cocktails_path
  end

  def new
    @dose = Dose.new
    @ingredients = Ingredient.all
  end

  def create
    @dose = Dose.new(doses_params)
    @ingredients = Ingredient.all
    # @dose.ingredient = Ingredient.find(params[:ingredient_id])
    @dose.cocktail = @cocktail

    if @dose.save
      puts "save ok"
      redirect_to cocktail_path(@cocktail)
    else
      puts "save raté"
      render :new
    end

  end

  private

  def doses_params
    params.require(:dose).permit(:description, :ingredient_id)
  end

  def find_cocktail
    @cocktail = Cocktail.find(params[:cocktail_id])
  end

  def set_dose
    @dose = Dose.find(params[:id])
  end

  def edit
  end

  def update
  end

end
