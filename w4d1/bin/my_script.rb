require 'addressable/uri'
require 'rest-client'

def create_user(name, email)
  url = Addressable::URI.new(
    scheme: 'http',
    host: 'localhost',
    port: 3000,
    path: '/users.json'
  ).to_s

  puts RestClient.post(
    url,
    { user: { name: name, email: email } }
  )
rescue RestClient::Exception => e
  p e
end

create_user("", "gizmo@gizmo.gizmo")
# "Gizmo",
