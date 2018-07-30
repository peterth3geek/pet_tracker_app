class PlaysController < ApplicationController

  def show
    # binding.pry
    @play = Play.find(params[:id])
  end

  def create
    # binding.pry
    @play = Play.new(play_params)
    if @play.save
      redirect_to @play
    end

  end

  private
  def play_params
    params.require(:play).permit(:pet_id, :owner_id, :notes, :time)
  end
end
