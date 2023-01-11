class TrainingController < ApplicationController
  def index
    @puzzle = Puzzle.order("RANDOM()").first
  end
end
