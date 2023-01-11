module Api
  class PuzzlesController < ActionController::API
    def create
      @puzzle = Puzzle.new(puzzle_params)
      @puzzle.user = User.first

      if @puzzle.save
        head 201
      else
        render json: @puzzle.errors, status: 400
      end
    end

    private

    def puzzle_params
      params.require(:puzzle).permit(:fen, :move)
    end
  end
end
