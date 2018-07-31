class PetsController < ApplicationController

  def index
    @pet = Pet.all
  end

  def show
    @pet = Pet.find(params[:id])
    @food = Food.new
    @waste = Waste.new
    @play = Play.new
  end

  def new
    @pet = Pet.new
  end

  def create
    @pet = Pet.new(pet_params)
    # binding.pry
    if @pet.save
      redirect_to @pet
    else
      render :new
    end
  end

  def edit
    @pet = Pet.find(params[:id])
  end

  def update
    @pet = Pet.find(params[:id])
    @pet.update(pet_params)
    if @pet.save
      redirect_to @pet
    else
      render :edit
    end

  end

  private
  def pet_params
    params.require(:pet).permit(:name, :weight, :age, :img_url, :species, :breed)
  end

end
