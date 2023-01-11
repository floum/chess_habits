class AddSuccessesAndTriesToPuzzles < ActiveRecord::Migration[7.0]
  def change
    add_column :puzzles, :successes, :integer
    add_column :puzzles, :tries, :integer
  end
end
