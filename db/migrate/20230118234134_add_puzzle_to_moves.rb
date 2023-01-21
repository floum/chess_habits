class AddPuzzleToMoves < ActiveRecord::Migration[7.0]
  def change
    add_column :moves, :puzzle, :boolean
  end
end
