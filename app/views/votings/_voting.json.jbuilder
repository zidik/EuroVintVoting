json.extract! voting, :id, :name, :start_time, :stop_time, :created_at, :updated_at
json.url voting_url(voting, format: :json)