class SessionsController < ApplicationController

  def new
  end

  def create
    # binding.pry
    @owner = Owner.find_by(name: params[:name])
    if @owner && @owner.authenticate(params[:password])
      session[:owner_id] = @owner.id
      redirect_to owner_path(@owner)
    else
      redirect_to root_path
    end
  end

  def destroy
    session.delete :owner_id
    redirect_to root_path
  end
end
