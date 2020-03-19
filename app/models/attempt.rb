class Attempt < ApplicationRecord
  belongs_to :candidate
  belongs_to :answer
  belongs_to :question
end
