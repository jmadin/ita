json.array!(@trips) do |trip|
  json.extract! trip, :id, :trip_name, :start_date, :end_date, :trip_notes
  json.url trip_url(trip, format: :json)
end
