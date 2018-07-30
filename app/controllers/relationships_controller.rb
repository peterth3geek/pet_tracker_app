class RelationshipsController < ApplicationController
  def index
    @relationships = Relationship.all
  end
end
