class PuzzlesController < ApplicationController
  def create
    @puzzle = Puzzle.new(puzzle_params)
    @puzzle.user = current_user
    if @puzzle.save
      redirect_to preparation_path
    else
      head 400
    end
  end

  def puzzle_params
    params.require(:puzzle).permit(:fen, :move)
  end
end
