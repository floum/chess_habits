module Api
  class GamesController < ActionController::API
    def create
      @game = Game.new(game_params)

      if @game.save
        render json: @game, status: :created
      end
    end

    def game_params
      params.permit(:lichess_id, :user_id)
    end
  end
end
