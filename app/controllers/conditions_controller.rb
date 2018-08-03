class ConditionsController < ApplicationController

  def index
    @conditions = Conditions.all
  end

  def show
    @condition = Condition.find(params[:id])
  end

  def new
    @condition = Condition.new
  end

  def create
    binding.pry
    @condition = Condition.create(condition_params)
    redirect_to condition_path(@condition)
  end

  def edit
    @condition = Condition.find(params[:id])
  end

  def update
    @condition = Condition.find(params[:id])
    if @condition.update(condition_params)
      redirect_to @condition
    else
      render :edit
    end
  end

  def destroy
    @condition = Condition.find(params[:id])
    @condition.destroy

    redirect_to current_user
  end

  private
  def condition_params
    params.require(:condition).permit(:title, :notes, :pet_id)
  end

end
