json.array!(@locations) do |location|
  json.extract! location, :id, :location_name, :location_code, :latitude, :longitude, :location_notes
  json.url location_url(location, format: :json)
end
