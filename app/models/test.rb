class Test < ApplicationRecord
  belongs_to :lab
  has_many :questions, dependent: :destroy, inverse_of: :test
  has_many :attempts
  accepts_nested_attributes_for :questions, allow_destroy: true, reject_if: :all_blank
end
