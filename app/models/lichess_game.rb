class LichessGame
  include ActiveModel::API

  attr_accessor :id, :pgn

  def load
    self.pgn = Lichess.fetch(id)
  end

  def user_color
    
  end
end
