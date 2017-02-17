# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


u1 = User.create!(email: 'justin', password: 'justin')
u2 = User.create!(email: 'password', password: 'password')


b1 = Band.create!(name: 'Wham')
b2 = Band.create!(name: 'Eric and Erica')

a1 = Album.create!(band_id: b1.id, album_type: "live")
a2 = Album.create!(band_id: b1.id, album_type: "studio")
a3 = Album.create!(band_id: b2.id, album_type: "live")

s1 = Track.create!(album_id: a1.id, track_type: "regular", lyrics: "song words")
s2 = Track.create!(album_id: a1.id, track_type: "regular", lyrics: "song words")
s3 = Track.create!(album_id: a1.id, track_type: "bonus", lyrics: "song words")

s4 = Track.create!(album_id: a2.id, track_type: "regular", lyrics: "song words")
s5 = Track.create!(album_id: a2.id, track_type: "regular", lyrics: "song words")

s6 = Track.create!(album_id: a3.id, track_type: "bonus", lyrics: "song words")
