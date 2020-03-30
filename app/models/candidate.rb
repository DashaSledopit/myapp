class Candidate < ApplicationRecord
  belongs_to :lab  
  belongs_to :test
  validates :email, uniqueness: { case_sensitive: false }
  has_many :attempts
  has_many :tests, through: :attempts
end
