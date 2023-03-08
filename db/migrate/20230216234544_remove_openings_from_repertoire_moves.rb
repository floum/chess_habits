class RemoveOpeningsFromRepertoireMoves < ActiveRecord::Migration[7.0]
  def change
    remove_reference :repertoire_moves, :opening, null: false, foreign_key: true
  end
end
