class RelationshipsController < ApplicationController
  def index
    @relationships = Relationship.all
  end

  def new
    @relationship = Relationship.new
  end

  def create
    # binding.pry
    @relationship = Relationship.new(relationship_params)
    if @relationship.valid?
      @relationship.save
      redirect_to owners_path
    else
      render :edit
    end
  end

  def show

  end


  def edit
    @relationship = Relationship.find_by(pet_id: params[:id])
    @pet = Pet.find(params[:id])
  end

  def update
    @relationship = Relationship.find(params[:id])
    if @relationship.update(relationship_params)
      # binding.pry
      redirect_to pet_path(@relationship.pet_id)
    else
      render :edit
    end
  end

  private
  def relationship_params
    params.require(:relationship).permit(:pet_id, :owner_id, :title)
  end

end
