module Api
  class PositionsController < ActionController::API
    def create
      fen = params[:fen]
      @position = Position.parse(params[:fen])
      @position.save
    end

    def analyze
      render json: Position.unanalyzed?.first, methods: :fen
    end
  end
end
