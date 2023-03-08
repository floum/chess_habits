class LichessGamesController < ApplicationController
  def create
    @lichess_game = LichessGame.new(lichess_game_params)
    @lichess_game.load

    render 'edit'
  end

  private

  def lichess_game_params
    params.permit(:id)
  end
end
