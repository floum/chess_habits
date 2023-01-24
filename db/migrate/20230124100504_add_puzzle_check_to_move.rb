class AddPuzzleCheckToMove < ActiveRecord::Migration[7.0]
  def change
    add_column :moves, :puzzle_check, :boolean
  end
end
