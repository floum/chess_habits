class Puzzle < ApplicationRecord
  belongs_to :user

  validates_presence_of :fen
  validates_presence_of :move
  validates_uniqueness_of :fen
end
