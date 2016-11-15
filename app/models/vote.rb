class Vote < ApplicationRecord
  belongs_to :registration

  validates :registration, presence: true

  # given a list of votes, gets the latest votes
  scope :latest_votes, -> (votes) {
    latest_ids_sql = votes.select("MAX(votes.id) as id").group(:from_phone).to_sql
    joins('INNER JOIN ('+latest_ids_sql+') latest_votes ON ("latest_votes"."id" = "votes"."id")')
  }

  scope :active, -> { where(active: true)}

end
