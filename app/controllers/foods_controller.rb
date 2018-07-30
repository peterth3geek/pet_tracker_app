class FoodsController < ApplicationController

  def show
    binding.pry
    @food = Food.find(params[:id])
  end

  def create
    binding.pry
    @food = Food.new(food_params)
    if @food.save
      redirect_to @food
    end

  end

  private
  def food_params
    params.require(:food).permit(:pet_id, :owner_id, :notes, :created_at)
  end

end
