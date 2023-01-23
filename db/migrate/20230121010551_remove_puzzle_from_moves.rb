class RemovePuzzleFromMoves < ActiveRecord::Migration[7.0]
  def change
    remove_column :moves, :puzzle, :string
  end
end
