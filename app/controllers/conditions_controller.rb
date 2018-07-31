class ConditionsController < ApplicationController

  def show
    @condition = Condition.find(params[:id])
  end
  
end
