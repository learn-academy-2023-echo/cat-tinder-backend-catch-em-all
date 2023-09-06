class PokemonsController < ApplicationController
  def index
    pokemons = Pokemon.all
    render json: pokemons
  end

  def create
    pokemon = Pokemon.create(pokemon_params)
    if pokemon.valid?
      render json: pokemon 
    else
      render json: pokemon.errors, status: 422
    end
  end

  def update
    pokemon = Pokemon.find(params[:id])
    pokemon.update(pokemon_params)
    if pokemon.valid?
      render json: pokemon
    else
      render json: pokemon.errors, status: 422
    end
  end

  def destroy
    pokemon = Pokemon.find(params[:id])
    pokemon.destroy
    if pokemon.valid?
      render json: pokemon
    else
      render json: pokemon.errors, status: 422
    end
  end

  private

  def pokemon_params
    params.require(:pokemon).permit(:name, :specialty, :level, :image, :strong_against, :weak_against, :enjoys)
  end
end
