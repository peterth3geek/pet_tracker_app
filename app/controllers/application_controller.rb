class ApplicationController < ActionController::Base
  helper_method :logged_in?
  helper_method :current_user
  helper_method :user_pet_relations
  helper_method :valid_owner?
  helper_method :valid_sitter?
  helper_method :valid_caretaker?
  protect_from_forgery prepend: true

  $OWNER = "Owner"
  $CARETAKER = "Caretaker"
  $SITTER = "Sitter"
  $VISITER = "Visiter"

  def current_user
    if session[:owner_id]
      @owner = Owner.find(session[:owner_id])
    else
    end
  end

  # For future use MVP: see my pets only
  def authorized
    redirect_to login_path unless logged_in?
  end

  def logged_in?
    !!current_user
  end

  def user_pet_relations_all
    arr = []
    current_user.pets.each do |pet|
      arr << pet.owners
    end
    arr.flatten.uniq
  end

  def user_pet_relations
    user_pet_relations_all.delete_if{|owner| owner == current_user}
  end

  def valid_owner?
    @role == $OWNER
  end

  def valid_caretaker?
    @role == $CARETAKER || @role == $OWNER
  end

  def valid_sitter?
    @role == $SITTER || @role == $CARETAKER || @role == $OWNER
  end


end
