require 'json'

class Session
  # find the cookie for this app
  # deserialize the cookie into a hash
  COOKIE_NAME = "_rails_lite_app"
  def initialize(req)
    @hash = {}
    cookie = req.cookies[COOKIE_NAME]
    if cookie
      cookie = JSON.parse(cookie)
      cookie.each do |key, val|
        self[key] = val
      end
    end
  end

  def [](key)
    @hash[key]
  end

  def []=(key, val)
    @hash[key] = val
  end

  # serialize the hash into json and save in a cookie
  # add to the responses cookies
  def store_session(res)
    cookie_hash = {path: "/", value: @hash.to_json}
    res.set_cookie(COOKIE_NAME, cookie_hash)
  end
end
