module Api
  class PositionsController < ActionController::API
    def create
      @position = Position.find_by(fen: params[:fen])

      unless @position
        @position = Position.new(position_params)
        @position.save
      end

      render json: @position
    end

    def update
      @position = Position.find(params[:id])

      @position.update(position_params)
      if @position.save
        head 201
      else
        render json: @position.errors, status: :bad_request
      end
    end

    def analyze
      @position = Position.where(depth: Position.minimum(:depth)).first
      render json: @position
    end

    def position_params
      params.permit(:fen, :depth, :score, :best_move, :criticality)
    end
  end
end
