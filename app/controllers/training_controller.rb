class TrainingController < ApplicationController
  def index
    @puzzle = Puzzle.order("RANDOM()").first(50).sort_by{ |puzzle| [puzzle.successes, puzzle.tries, puzzle.updated_at] }.first
  end
end
