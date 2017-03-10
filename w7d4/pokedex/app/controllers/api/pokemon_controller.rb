class Api::PokemonController < ApplicationController
  def index
    @pokemons = Pokemon.all
    render :index
  end

  def show
    @pokemon = Pokemon.find(params[:id])
  end

  def create
    @pokemon = Pokemon.new(pokemon_params)
    if @pokemon.save
      render :show
    else
      flash.now = "Invalid Parameters"
    end
  end

  private
  def pokemon_params
    params.require(:poke).permit(:name, :attack, :defense, :poke_type, :image_url, :moves => [])
  end

end
