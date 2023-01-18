class AddCriticalityToAnalyses < ActiveRecord::Migration[7.0]
  def change
    add_column :analyses, :criticality, :float
  end
end
