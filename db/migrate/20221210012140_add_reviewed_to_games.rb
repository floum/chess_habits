class AddReviewedToGames < ActiveRecord::Migration[7.0]
  def change
    add_column :games, :reviewed, :boolean
  end
end
