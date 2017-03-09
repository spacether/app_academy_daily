json.extract! @pokemon, :id, :name, :attack, :defense, :moves, :poke_type

# json.image_url @pokemon.image_url
json.image_url asset_path(@pokemon.image_url)

json.items @pokemon.items do |item|
  json.extract! item, :id, :name, :pokemon_id, :price, :happiness, :image_url
end
