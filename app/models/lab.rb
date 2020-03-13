class Lab < ApplicationRecord
    has_many :candidates
    has_one :test
end
