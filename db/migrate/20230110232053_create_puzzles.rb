class CreatePuzzles < ActiveRecord::Migration[7.0]
  def change
    create_table :puzzles do |t|
      t.string :fen
      t.string :move
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
