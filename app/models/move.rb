class Move < ApplicationRecord
  belongs_to :user
  belongs_to :position

  validates_uniqueness_of :move, scope: [:user, :position]

  def blunder
    position.criticality > 2 && position.best_move != move
  end
end
