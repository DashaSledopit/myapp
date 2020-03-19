class Question < ApplicationRecord
  belongs_to :test, optional: true
  has_many :answers, dependent: :destroy
  has_many :attempts
  accepts_nested_attributes_for :answers, allow_destroy: true
end
