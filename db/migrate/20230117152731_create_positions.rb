class CreatePositions < ActiveRecord::Migration[7.0]
  def change
    create_table :positions do |t|
      t.string :fen_board
      t.string :fen_castling
      t.string :en_passant
      t.string :active_color

      t.timestamps
    end
  end
end
