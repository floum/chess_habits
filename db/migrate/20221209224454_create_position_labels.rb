class CreatePositionLabels < ActiveRecord::Migration[7.0]
  def change
    create_table :position_labels do |t|
      t.references :position, null: false, foreign_key: true
      t.integer :label_id

      t.timestamps
    end
  end
end
