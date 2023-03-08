class PrepareController < ApplicationController
  def index
    @lichess_game = LichessGame.new
  end

  def new
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
        position = Position.find_by(fen: fen)
        unless position
          position = Position.create(fen: fen)
        end
        @repertoire_move = RepertoireMove.find_by(user: current_user, position: position)
        unless @repertoire_move
          @repertoire_move = RepertoireMove.new(position: position, user: current_user)
          break
        end
      end
    end

    p @repertoire_move
  end
end
