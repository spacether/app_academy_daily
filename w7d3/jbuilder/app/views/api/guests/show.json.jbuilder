# json.extract! @guest, :name, :age, :favorite_color, :gifts, :invitations, :parties


json.partial! 'guest', guest: @guest
json.gifts @guest.gifts
