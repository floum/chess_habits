class Position < ApplicationRecord
  has_one :analysis

  def self.unanalyzed?
    Position.all.select {|position| !position.analysis }
  end

  def self.parse(fen)
    position = Position.new
    position.fen_board = fen.split(' ')[0]
    position.active_color = fen.split(' ')[1]
    position.fen_castling = fen.split(' ')[2]
    position.en_passant = fen.split(' ')[3]
    position
  end

  def fen
    "#{fen_board} #{active_color} #{fen_castling} #{en_passant} 0 1"
  end
end
