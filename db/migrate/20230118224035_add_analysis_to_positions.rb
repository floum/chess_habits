class AddAnalysisToPositions < ActiveRecord::Migration[7.0]
  def change
    add_column :positions, :depth, :integer
    add_column :positions, :score, :float
    add_column :positions, :best_move, :string
    add_column :positions, :criticality, :float
  end
end
