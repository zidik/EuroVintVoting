class RestrictedNumber < ApplicationRecord
  validates :number, presence: true
end
