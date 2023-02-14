class TrainingController < ApplicationController
  def index
    @user = current_user
    redirect_to root_path if @user.new_record?
    @puzzle = Puzzle.where(user: current_user)
      .order("RANDOM()")
      .first(15)
      .sort_by{ |puzzle| [puzzle.successes, puzzle.tries, puzzle.updated_at] }
      .first
  end
end
