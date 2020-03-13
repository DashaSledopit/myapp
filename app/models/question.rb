class Question < ApplicationRecord
  belongs_to :test, optional: true
  has_many :answers, dependent: :destroy
  accepts_nested_attributes_for :answers, allow_destroy: true
end
