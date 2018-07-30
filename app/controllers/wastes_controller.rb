class WastesController < ApplicationController
  def show
    # binding.pry
    @waste = Waste.find(params[:id])
  end

  def create
    # binding.pry
    @waste = Waste.new(waste_params)
    if @waste.save
      redirect_to @waste
    end

  end

  private
  def waste_params
    params.require(:waste).permit(:pet_id, :owner_id, :notes, :time)
  end
end
