class AddCorrectAnswerToAnswers < ActiveRecord::Migration[6.0]
  def change
    add_column :answers, :correct_answer, :text
  end
end
