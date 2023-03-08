class Position < ApplicationRecord
  validates_uniqueness_of :fen

  has_many :moves

  attribute :depth, :integer, default: 0
  attribute :score, :float, default: 0.0
  attribute :criticality, :float, default: 0.0

  def color
    fen.split(' ')[1] == 'w' ? :white : :black
  end

  def box?
    score && criticality && (equity - next_best_equity > 0.2)
  end

  def equity
    _equity(score)
  end

  def next_best_equity
    _equity(score - criticality)
  end

  private

  def _equity(score)
    (50 + 50 * (2 / (1 + Math.exp(-0.00368208 * score * 100)) - 1)) / 100
  end
end
