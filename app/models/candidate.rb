class Candidate < ApplicationRecord
  belongs_to :lab 
  validates :email, uniqueness: { case_sensitive: false }
  has_many :attempts
  #has_many :tests
end
