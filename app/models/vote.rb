class Vote < ApplicationRecord
  belongs_to :registration

  validates :registration, presence: true
end
