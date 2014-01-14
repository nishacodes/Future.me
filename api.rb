require 'oauth'
require 'json'
require 'open-uri'

consumer = OAuth::Consumer.new("77ze1x9zbqkfe7", "vnVI2BZxFEm8QxNM")
access_token = OAuth::AccessToken.new(consumer, "e974f1f1-9f42-4ab0-af97-b32bd6229e22", "f732020e-436c-4b34-882c-c29973bfb5e3")
 
# Pick some fields
fields = ['first-name', 'last-name', 'headline', 'industry', 'num-connections'].join(',')

# Make a request for JSON data
json_txt = access_token.get("http://api.linkedin.com/v1/people/~:(#{fields})", 'x-li-format' => 'json').body
profile = JSON.parse(json_txt)
puts "Profile data:"
puts JSON.pretty_generate(profile)