class Candidate < ApplicationRecord
  belongs_to :lab  
  validates :email, uniqueness: { case_sensitive: false }


end
