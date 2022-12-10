class AddLichessIdToGames < ActiveRecord::Migration[7.0]
  def change
    add_column :games, :lichess_id, :string
  end
end
