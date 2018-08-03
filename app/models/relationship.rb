class Relationship < ApplicationRecord
  belongs_to :pet
  belongs_to :owner

  accepts_nested_attributes_for :owner
  # def self.mypets
  #
  #   Relationship.all.select do |rel|
  #     rel.owner_id == request.session_options[:owner_id]
  #   end
  # end

end
