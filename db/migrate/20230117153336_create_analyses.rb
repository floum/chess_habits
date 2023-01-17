class CreateAnalyses < ActiveRecord::Migration[7.0]
  def change
    create_table :analyses do |t|
      t.string :best_move
      t.references :position, null: false, foreign_key: true
      t.float :score

      t.timestamps
    end
  end
end
