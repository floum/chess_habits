module Api
  class PuzzlesController < ActionController::API
    def create
      @puzzle = Puzzle.new(puzzle_params)
      p params[:username]
      @puzzle.user = User.find_by(name: params[:username])

      if @puzzle.save
        head 201
      else
        render json: @puzzle.errors, status: 400
      end
    end

    def update
      @puzzle = Puzzle.find(params[:id])
      @puzzle.tries += 1
      @puzzle.successes += 1 if params[:success]

      @puzzle.save
      render json: @puzzle
    end

    private

    def puzzle_params
      params.require(:puzzle).permit(:fen, :move)
    end
  end
end
