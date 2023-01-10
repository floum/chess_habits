class PrepareController < ApplicationController
  def index
    @puzzle = Puzzle.new(user: current_user)
  end
end
