class FoodsController < ApplicationController

  def show
    # binding.pry
    get_food
  end

  def new
    @food = Food.new
  end

  def create
    # binding.pry
    @food = Food.new(food_params)
    if @food.save
      redirect_to @food
    end

  end

  def edit
    get_food
  end

  def update
    get_food
    @food.update(food_params)
    redirect_to @food
  end

  def destroy
    @food = Food.find(params[:id])
    @food.destroy

    redirect_to current_user
  end

  private
  def food_params
    params.require(:food).permit(:pet_id, :owner_id, :notes, :time)
  end

  def get_food
    @food = Food.find(params[:id])
  end

end
