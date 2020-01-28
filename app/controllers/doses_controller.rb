class DosesController < ApplicationController
  def new
    set_cocktail
    @dose = Dose.new
  end

  def create
    set_cocktail
    @dose = Dose.new(dose_params)
    @dose.cocktail = @cocktail
    if @dose.save
      redirect_to cocktail_path(@cocktail)
      #  cocktail_doses GET    /cocktails/:cocktail_id/doses(.:format)
      # doses#index
      # POST   /cocktails/:cocktail_id/doses(.:format)
      # doses#create
    else
      render :new
    end
  end
  # DELETE /cocktails/:cocktail_id/doses/:id

  def destroy
    @dose = Dose.find(params[:id])
    @dose.destroy
    redirect_to cocktail_path(@dose.cocktail)
  end

  private

  def set_cocktail
    # *Strong params*: You need to *whitelist* what can be updated by the user
    # Never trust user data!
    @cocktail = Cocktail.find(params[:cocktail_id])
  end

  def dose_params
    params.require(:dose).permit(:description, :ingredient_id)
  end
  # "description"
  # "cocktail_id"
  # "ingredient_id"
end
