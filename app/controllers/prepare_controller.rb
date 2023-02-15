class PrepareController < ApplicationController
  def index
  end

  def import
    game = Lichess.fetch(params[:lichess_id])
    if game["players"]["white"]["user"]["name"] == current_user.name
      player_index = 0
    end

    if game["players"]["black"]["user"]["name"] == current_user.name
      player_index = 1
    end

    throw :player_not_found unless player_index

    cgame = Chess::Game.new

    fens = []
    game["moves"].split(' ').each_with_index do |move, index|
      fen = cgame.board.to_fen
      cgame.move(move)
      uci = cgame.coord_moves.last

      if index % 2 == player_index
        fens << fen
      end
    end

    p fens
    @position = Position.new(
  end
end
