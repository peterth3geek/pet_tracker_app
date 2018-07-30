class OwnersController < ApplicationController

  def index
    @owners = Owner.all
  end

  def new
    @owner = Owner.new
  end

  def create
    # binding.pry
    @owner = Owner.create(owner_params)
    if @owner.save
      session[:owner_id] = @owner.id
      redirect_to owner_path
    else
      render :new
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
    params.require(:owner).permit(:name, :password, :password_confirmation)
  end
end
