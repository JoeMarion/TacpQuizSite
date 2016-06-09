class CreateScores < ActiveRecord::Migration
  def change
    create_table :scores do |t|
      t.references :user, index: true, foreign_key: true
      t.integer :correct, default: 0
      t.integer :incorrect, default: 0

      t.timestamps null: false
    end
  end
end
