class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :question
      t.integer :volume

      t.timestamps null: false
    end
  end
end
