class SessionsController < ApplicationController
  def new
    @owner = Owner.new
  end

  def create
    @owner = Owner.find_by(name: params[:owner][:name])
    if @owner && @owner.authenticate(params[:owner][:password])
      current_user = @owner.id
      redirect_to owner_path
    else
      redirect_to login_path
    end
  end
end
