# json.array! @guests, :name, :age, :favorite_color, :invitations, :parties

# json.array! @guests, :name, :age, :favorite_color, :invitations, :parties

# json.array! @guests do |guest|
#   json.name guest.name
#   json.age guest.age
#   json.favorite_color guest.favorite_color
#   json.invitations guest.invitations
#   json.parties guest.parties
# end

json.array! @guests do |guest|
  if guest.age <= 50 && guest.age >= 40
    json.partial! 'guest', guest: guest
  end
end
