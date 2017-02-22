require 'rack'

app = Proc.new do |env|
  req = Rack::Request.new(env)
  res = Rack::Response.new

  #res.write(req.path)
  res['Content-Type'] = 'text/html'
  res.write(res.content_length)
  # fullpath /ss?what=5
  # path /ss
  res.finish
end

Rack::Server.start(
  app: app,
  Port: 3000
)
