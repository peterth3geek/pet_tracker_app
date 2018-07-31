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

end
