# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.delete_all
ShortenedUrl.delete_all
Visit.delete_all

u1 = User.create!(email: "1_@google.com")
u2 = User.create!(email: "2_@google.com")
u3 = User.create!(email: "3_@google.com")

s1 = ShortenedUrl.make(u1, "https://one.com/")
s2 = ShortenedUrl.make(u1, "https://two.com/")
s3 = ShortenedUrl.make(u2, "https://three.com/")
s4 = ShortenedUrl.make(u3, "https://one.com/")

Visit.record_visit!(u1, s1)
Visit.record_visit!(u1, s2)
Visit.record_visit!(u1, s3)
Visit.record_visit!(u2, s3)
Visit.record_visit!(u3, s1)
Visit.record_visit!(u3, s2)
Visit.record_visit!(u2, s1)
Visit.record_visit!(u1, s1)

t1 = Topic.create!(name: "music")
t2 = Topic.create!(name: "news")
t3 = Topic.create!(name: "sports")
t4 = Topic.create!(name: "comedy")
t5 = Topic.create!(name: "politics")

Tag.create!(topic_id: t1.id, url_id: s1.id)
Tag.create!(topic_id: t2.id, url_id: s1.id)
Tag.create!(topic_id: t3.id, url_id: s1.id)
Tag.create!(topic_id: t1.id, url_id: s2.id)
Tag.create!(topic_id: t5.id, url_id: s2.id)
Tag.create!(topic_id: t4.id, url_id: s3.id)
