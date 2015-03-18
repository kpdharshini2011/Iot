json.array!(@pulses) do |pulse|
  json.extract! pulse, :id, :pulse_rate, :pulse_time
  json.url pulse_url(pulse, format: :json)
end
