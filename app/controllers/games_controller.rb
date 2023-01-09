class GamesController < ApplicationController
  def index
    @games = Game.all
  end

  def import
    @game = Game.new(
      pgn: Lichess.fetch(params[:lichess_id]),
      lichess_id: params[:lichess_id],
      reviewed: false,
    )
    if @game.save
      flash[:notice] = 'Game saved'
      redirect_to game_path(@game)
    else
      flash[:alert] = "Game was not saved : #{@game.errors.full_messages}"
      redirect_to games_path
    end

  end

  def show
    @game = Game.find(params[:id])
  end
end
