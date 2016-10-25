json.extract! voting, :id, :name, :running, :created_at, :updated_at
json.url voting_url(voting, format: :json)