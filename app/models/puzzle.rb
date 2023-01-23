class Puzzle < ApplicationRecord
  attribute :tries, :integer, default: 0
  attribute :successes, :integer, default: 0

  belongs_to :user
  belongs_to :position

  validates_uniqueness_of :position, scope: :user

  def color
    position.fen.split(" ")[1] == 'w' ? 'white' : 'black'
  end

  delegate :fen, to: :position

  def move
    position.best_move
  end
end
