class TrainingController < ApplicationController
  def index
    @user = current_user
    @puzzle = Puzzle.where(user: current_user)
      .order("RANDOM()")
      .first(15)
      .sort_by{ |puzzle| [puzzle.successes, puzzle.tries, puzzle.updated_at] }
      .first
  end
end
