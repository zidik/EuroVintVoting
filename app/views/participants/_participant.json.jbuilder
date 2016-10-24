json.extract! participant, :id, :country, :artist, :title, :created_at, :updated_at
json.url participant_url(participant, format: :json)