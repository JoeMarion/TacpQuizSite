class AddSelectedToScores < ActiveRecord::Migration
  def change
    add_column :scores, :selected, :string
  end
end
