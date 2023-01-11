class TrainingController < ApplicationController
  def index
    @puzzle = Puzzle.first
  end
end
