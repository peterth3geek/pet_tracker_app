class PetsController < ApplicationController

  def index
    owner = Owner.find(session[:owner_id])

    @pets = owner.pets
  end

  def show
    @pet = Pet.find(params[:id])
    @food = Food.new
    @waste = Waste.new
    @play = Play.new
    @appointment = Appointment.new
    owner = session[:owner_id]
    role = @pet.are_you_mine(owner)
    # binding.pry
    if role[0] == nil
      @role = "Visiter"
    else
      @role = role[0].title
    end
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

  def destroy
    @pet = Pet.find(params[:id])
    @pet.delete
    redirect_to pets_path 
  end

  private
  def pet_params
    params.require(:pet).permit(:name, :weight, :age, :image, :species, :breed)
  end

  def pet_rel_params
    params[:pet].require(:relationship).permit(:owner_id)
  end

end
