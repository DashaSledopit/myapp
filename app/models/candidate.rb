class Candidate < ApplicationRecord
  belongs_to :lab
  has_many :attempts
  validates :email, uniqueness: { case_sensitive: false }


end
