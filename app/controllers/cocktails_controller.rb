class CocktailsController < ApplicationController
  def index
    # GET /cocktails
    @cocktails = Cocktail.all
  end

  def show
    # GET /cocktails/:id
    @cocktail = Cocktail.find(params[:id])
    @dose = Dose.new
  end

  def new
    # GET /cocktails/new
    @cocktail = Cocktail.new
  end

  def create
    # POST /cocktails
    @cocktail = Cocktail.new(cocktail_params)
    if @cocktail.save
      # no need for app/views/cocktails/create.html.erb
      redirect_to cocktail_path(@cocktail)
      # cocktail GET  /cocktails/:id(.:format)
      # cocktails#show
    else
      # redirect_to new_cocktail_path
      render :new
      # render 'new'
    end
  end

  private

  def cocktail_params
    params.require(:cocktail).permit(:name, :photo)
  end
end
