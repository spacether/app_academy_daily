# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.destroy_all
User.create(username: 'Justin', password: 'justin')

Bench.destroy_all

benches = []
benches << ["grand view", 37.756600, -122.471459]
benches << ["twin peaks", 37.751366, -122.447963]
benches << ["buena vista", 37.767345, -122.441021]
benches << ["stowe lake", 37.770727, -122.477075]
benches << ["bernal heights", 37.743104, -122.415723]

benches.each do |bench|
  Bench.create(description: bench[0], lat: bench[1], lng: bench[2])
end
