module Api
  class MovesController < ActionController::API
    def create
      @move = Move.new(move_params)
      if @move.save
        render json: @mov
      else
        render json: @move.errors, status: :bad_request
      end
    end

    private

    def move_params
      params.permit(:user_id, :position_id, :move)
    end
  end
end
