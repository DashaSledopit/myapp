class CreateAttempts < ActiveRecord::Migration[6.0]
  def change
    create_table :attempts do |t|
      t.references :candidate, null: false, foreign_key: true
      t.references :answer, null: false, foreign_key: true
      t.references :question, null: false, foreign_key: true
      t.string :attempts, array: true, default: []

      t.timestamps
    end
  end
end
