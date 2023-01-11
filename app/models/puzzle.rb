class Puzzle < ApplicationRecord
  belongs_to :user

  validates_presence_of :fen
  validates_presence_of :move
  validates_uniqueness_of :fen

  def color
    fen.split(" ")[1] == 'w' ? 'white' : 'black'
  end
end
