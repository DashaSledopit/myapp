class Question < ApplicationRecord
  belongs_to :test, optional: true
  has_many :answers, dependent: :destroy
  accepts_nested_attributes_for :answers, allow_destroy: true
  has_one :correct_answer, -> { correct.limit(1) }, class_name: 'Answer' 

  def correct?(answer_id) 
    correct_answer.id == answer_id
  end
end


