class AddTriesAndSuccessesToRepertoireMoves < ActiveRecord::Migration[7.0]
  def change
    add_column :repertoire_moves, :tries, :integer
    add_column :repertoire_moves, :successes, :integer
  end
end
