require 'launchy'

if $PROGRAM_NAME == __FILE__
  puts "Input your email:"
  email = gets.chomp
  user = User.create!(email: email)

  puts "\nWhat do you want to do?"
  puts "0. Create shortned URL"
  puts "1. Visit shortened URL"
  input = gets.chomp.to_i

  if input == 0
    puts "\nType in your long url"
    long_url = gets.chomp
    short_url = ShortenedUrl.make(user, long_url).short_url


    puts "\nShort url is: #{short_url}"
    puts "Goodbye!"
    Launchy.open short_url
    gets.chomp

  else
    puts "\nType in the shortened URL"
    puts "Example: Pm6T7vWIhTWfMzLaT02YHQ"

    short_url = gets.chomp
    puts "\nLaunching #{short_url}"
    puts "Goodbye"
    Launchy.open short_url
  end

end
