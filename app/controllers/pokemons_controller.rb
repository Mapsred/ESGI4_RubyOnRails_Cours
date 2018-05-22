# frozen_string_literal: true

# PokemonsController
class PokemonsController < ApplicationController
  before_action :fetch_pokemon, only: %i[show edit update]

  def fetch_pokemon
    @pokemon = Pokemon.find(params[:id])
  end

  def index
    @pokemons = Pokemon.all
  end

  def show
    # @pokemon fetched from :fetch_pokemon
  end

  def new
    @pokemon = Pokemon.new
  end

  def create
    @pokemon = Pokemon.new pokemon_parameters
    if @pokemon.save
      redirect_to pokemons_url
    else
      render action: 'new'
    end
  end

  def edit
    # @pokemon fetched from :fetch_pokemon
  end

  def update
    if @pokemon.update_attributes pokemon_parameters
      flash[:success] = 'Pokemon #' + params[:id] + ' updated !'

      redirect_to pokemon_url @pokemon
    else
      render action: :edit
    end
  end

  def pokemon_parameters
    params.require(:pokemon).permit(:name)
  end

end
