class Attempt < ApplicationRecord
  belongs_to :test
  belongs_to :candidate, optional: true
end
