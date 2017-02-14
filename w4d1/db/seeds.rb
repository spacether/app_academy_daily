# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

u1 = User.create!(username: 'Bob')
u2 = User.create!(username: 'Amanda')
u3 = User.create!(username: 'Sam')

c1 = Contact.create!(name: 'Tony', email: 'tony@blah', user_id: u1.id)
c2 = Contact.create!(name: 'Kat', email: 'kat@blah', user_id: u1.id)
c3 = Contact.create!(name: 'Erin', email: 'erin@blah', user_id: u3.id)
c4 = Contact.create!(name: 'Mark', email: 'mark@blah', user_id: u2.id)

s1 = ContactShare.create!(user_id: u1.id, contact_id: c3.id)
s2 = ContactShare.create!(user_id: u1.id, contact_id: c4.id)

s3 = ContactShare.create!(user_id: u2.id, contact_id: c1.id)
s4 = ContactShare.create!(user_id: u2.id, contact_id: c2.id)
s5 = ContactShare.create!(user_id: u2.id, contact_id: c3.id)

s6 = ContactShare.create!(user_id: u3.id, contact_id: c1.id)
