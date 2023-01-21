class Move < ApplicationRecord
  belongs_to :user
  belongs_to :position

  def blunder
    position.criticality > 2 && position.best_move != move
  end
end
