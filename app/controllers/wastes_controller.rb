class WastesController < ApplicationController
  def show
    # binding.pry
    get_waste
  end

  def create
    # binding.pry
    @waste = Waste.new(waste_params)
    if @waste.save
      redirect_to @waste
    end

  end

  def edit
    get_waste
  end

  def update
    get_waste
    @waste.update(waste_params)
    redirect_to @waste
  end


  private
  def waste_params
    params.require(:waste).permit(:pet_id, :owner_id, :notes, :time)
  end

  def get_waste
    @waste = Waste.find(params[:id])
  end
end
