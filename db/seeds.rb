# Seed airports first
airports = Airport.create!([
  { code: 'SFO' },
  { code: 'NYC' },
  { code: 'LAX' },
  { code: 'ORD' }
])

# Create some flights between airports
Flight.create!(departure_airport: airports[0], arrival_airport: airports[1], start_datetime: DateTime.now + 2.days, duration: 300)
Flight.create!(departure_airport: airports[1], arrival_airport: airports[2], start_datetime: DateTime.now + 3.days, duration: 240)

# Optionally, you could create additional airports if needed
additional_airports = ["ATL", "DFW"]
additional_airports.each do |code|
  Airport.find_or_create_by(code: code)
end
