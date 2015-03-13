json.array!(@temperatures) do |temperature|
  json.extract! temperature, :id, :temp_time, :celcius, :farenhiet
  json.url temperature_url(temperature, format: :json)
end
