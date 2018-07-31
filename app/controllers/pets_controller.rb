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
    if @pet.save
      @pet.image.attach(pet_params[:image])
      Relationship.create(pet_id: @pet.id, owner_id: pet_rel_params[:owner_id], title: "Owner" )

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
    params.require(:pet).permit(:name, :weight, :age, :image, :species, :breed)
  end

  def pet_rel_params
    params[:pet].require(:relationship).permit(:owner_id)
  end

end
