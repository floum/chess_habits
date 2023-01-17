class AddDepthToAnalyses < ActiveRecord::Migration[7.0]
  def change
    add_column :analyses, :depth, :integer
  end
end
