class CreateAttempts < ActiveRecord::Migration[6.0]
  def change
    create_table :attempts do |t|
      t.integer :wrong_answers
      t.integer :correct_answers
      t.references :test, null: false, foreign_key: true
      t.references :candidate, foreign_key: true

      t.timestamps
    end
  end
end
