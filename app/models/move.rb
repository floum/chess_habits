class Move < ApplicationRecord
  belongs_to :game
  belongs_to :position
  belongs_to :user

  validates_uniqueness_of :move, scope: [:user, :position]

  def blunder
    position.criticality > 2 && position.best_move != move
  end

  delegate :user, to: :game
end
