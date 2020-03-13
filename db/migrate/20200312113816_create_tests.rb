class CreateTests < ActiveRecord::Migration[6.0]
  def change
    create_table :tests do |t|
      t.string :test_name
      t.references :lab, null: false, foreign_key: true

      t.timestamps
    end
  end
end
