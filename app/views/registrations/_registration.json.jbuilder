json.extract! registration, :id, :order_no, :voting_id, :participant_id, :created_at, :updated_at
json.url registration_url(registration, format: :json)