class AddPositionReferenceToPuzzles < ActiveRecord::Migration[7.0]
  def change
    add_reference :puzzles, :position, null: false, foreign_key: true
  end
end
