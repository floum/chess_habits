class RemovesUserFromMoves < ActiveRecord::Migration[7.0]
  def change
    remove_column :moves, :user_id, :integer
  end
end
