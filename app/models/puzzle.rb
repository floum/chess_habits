class Puzzle < ApplicationRecord
  after_initialize :init_tries
  after_initialize :init_successes

  belongs_to :user

  validates_presence_of :fen
  validates_presence_of :move
  validates_uniqueness_of :fen, scope: :user

  def color
    fen.split(" ")[1] == 'w' ? 'white' : 'black'
  end

  def init_tries
    self.tries ||= 0
  end

  def init_successes
    self.successes ||= 0
  end
end
