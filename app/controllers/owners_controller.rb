class OwnersController < ApplicationController

  def index
    @owners = Owner.all
  end

  def new
    @owner = Owner.new
  end

  def create
    @owner = Owner.create(name: owner_params[:name], password: owner_params[:password], password_confirmation: owner_params[:password_confirmation])
    if @owner.save
      session[:owner_id] = @owner.id
      redirect_to owner_path
    else
      redirect_to signup_path
    end
  end

  def show
    @owner = find_owner
  end

  def destroy
    session.delete :user_id
  end

  private
  def find_owner
    Owner.find(params[:id])
  end

  def owner_params(*args)
    params.require(:owner).permit(*args)
  end
end
