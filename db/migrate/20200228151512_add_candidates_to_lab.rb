class AddCandidatesToLab < ActiveRecord::Migration[6.0]
  def change
    add_reference :candidates, :lab
  end
end
