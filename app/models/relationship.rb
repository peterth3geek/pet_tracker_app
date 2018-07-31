class Relationship < ApplicationRecord
  belongs_to :pet
  belongs_to :owner

  def self.mypets
    Relationship.all.select {|rel| rel.owner_id == session[:owner_id]}
  end

end
