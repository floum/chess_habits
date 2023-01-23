class RemoveMoveAndFenFromPuzzles < ActiveRecord::Migration[7.0]
  def change
    remove_column :puzzles, :fen, :string
    remove_column :puzzles, :move, :string
  end
end
