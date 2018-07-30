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
      redirect_to @owner
    else
      render :new
    end
  end

  def show
    @owner = find_owner
  end

  def edit
    @owner = find_owner
  end

  def update
    @owner = find_owner
    if @owner.update(update_params)
      redirect_to @owner
    else
      render :edit
    end
  end

  private
  def find_owner
    Owner.find(params[:id])
  end

  def update_params
    params.require(:owner).permit(:name, :bio, :gender, :img_url, :password, :password_confirmation)
  end

  def owner_params(*args)
    params.require(:owner).permit(:name, :password, :password_confirmation)
  end
end
