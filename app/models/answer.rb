class Answer < ApplicationRecord
  belongs_to :question
  has_many :attempts

  scope :correct, -> { where(correct: true) } #выбираем все правильные ответы 
end
