json.extract! vote, :id, :registration_id, :from_phone, :to_phone, :from_country, :created_at, :updated_at
json.url vote_url(vote, format: :json)