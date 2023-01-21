class CreateMoves < ActiveRecord::Migration[7.0]
  def change
    create_table :moves do |t|
      t.references :user, null: false, foreign_key: true
      t.references :position, null: false, foreign_key: true
      t.string :move

      t.timestamps
    end
  end
end
