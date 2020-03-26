class Question < ApplicationRecord
  belongs_to :test, optional: true
  has_many :answers, dependent: :destroy
  has_many :attempts
  accepts_nested_attributes_for :answers, allow_destroy: true

  has_one :correct_answer, -> { correct.limit(1) }, class_name: 'Answer' #находим правильный ответ для этого вопроса

  def correct?(answer_id) #проверяем совпадает ли наш ответ с правильным
    correct_answer.id == answer_id
  end
end
