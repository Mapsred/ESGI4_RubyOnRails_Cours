# frozen_string_literal: true

# MovesController
class MovesController < ApplicationController
  before_action :fetch_move, only: %i[show edit update destroy]

  def index
    @moves = Move.all
  end

  def show; end

  def new
    @move = Move.new
  end

  def edit; end

  def create
    @move = Move.new(move_parameters)

    if @move.save
      redirect_to @move, notice: 'Move was successfully created.'
    else
      render :new
    end
  end

  def update
    if @move.update(move_parameters)
      redirect_to @move, notice: 'Move was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @move.destroy
    redirect_to moves_url, notice: 'Move was successfully destroyed.'
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def fetch_move
    @move = Move.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def move_parameters
    params.require(:move).permit(:name, :description, :type_id)
  end
end
