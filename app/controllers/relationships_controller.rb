class RelationshipsController < ApplicationController
  def index
    @relationships = Relationship.all
  end

  def new
    @relationship = Relationship.new
  end

  def create
    @owner = Owner.find_by(user_name)
    @relationship = Relationship.new(pet_id: relationship_params[:pet_id], title: relationship_params[:title], owner_id: @owner.id)
    if @relationship.valid?
      @relationship.save
      redirect_to owner_path(@relationship.owner)
    else
      render :new
    end
  end

  def show

  end


  def edit
    @relationship = Relationship.find(params[:id])
    @pet = Pet.find(params[:id])
  end

  def update
    @relationship = Relationship.find_or_create_by(pet_id: relationship_params[:pet_id], owner_id: relationship_params[:owner_id])
    if @relationship.update(update_relationship_params)
      redirect_to pet_path(@relationship.pet_id)
    else
      render :edit
    end
  end

  private
  def relationship_params
    params.require(:relationship).permit(:pet_id, :owner_id, :title, owners: [:name])
  end

  def update_relationship_params
    params.require(:relationship).permit(:title)
  end

  def user_nested_params
    params.require(:relationship).permit(owners: :name)
  end

  def user_name
    user_nested_params.require(:owners).permit(:name)
  end

end
