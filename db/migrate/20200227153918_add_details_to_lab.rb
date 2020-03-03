class AddDetailsToLab < ActiveRecord::Migration[6.0]
  def change
    add_column :labs, :lab_name, :string
    add_column :labs, :starting_date, :datetime
    add_column :labs, :description, :text
  end
end
