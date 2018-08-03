class PlaysController < ApplicationController

  def index
    @plays = Play.all
  end

  def show
    # binding.pry
    @play = Play.find(params[:id])
  end

  def new
    @play = Play.new
  end

  def create
    # binding.pry
    @play = Play.new(play_params)
    if @play.save
      redirect_to @play
    end

  end

  def edit
    @play = Play.find(params[:id])
  end

  def update
    @play = Play.find(params[:id])
    @play.update(play_params)

    redirect_to @play
  end

  private
  def play_params
    params.require(:play).permit(:pet_id, :owner_id, :notes, :time)
  end
end
