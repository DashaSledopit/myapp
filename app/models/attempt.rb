class Attempt < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :test
end
