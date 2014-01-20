
require 'oauth'
require 'json'

consumer = OAuth::Consumer.new("77ze1x9zbqkfe7", "vnVI2BZxFEm8QxNM")
access_token = OAuth::AccessToken.new(consumer, "e974f1f1-9f42-4ab0-af97-b32bd6229e22", "f732020e-436c-4b34-882c-c29973bfb5e3")
 
# Pick some fields
fields = ['id', 'first-name', 'last-name', 'headline', 'industry', 'distance', 'num-connections', 'positions', 'educations', 'member-url-resources'].join(',')

# Make a request for JSON data
json_txt = access_token.get("http://api.linkedin.com/v1/people-search:(people,facets)?facet=maiden-name", 'x-li-format' => 'json').body
profile = JSON.parse(json_txt)
puts "Profile data:"
puts JSON.pretty_generate(profile)

# returns all things defined in fields for Derek's profile
# get_person_profile

# returns name and linkedin url of a person
# get_user_profile
json_txt = access_token.get("http://api.linkedin.com/v1/people::(id=MjbuON9bxM):(first-name,last-name,public-profile-url,headline,industry,num-connections,positions,educations)", 'x-li-format' => 'json').body
json_txt = access_token.get("https://api.linkedin.com/v1/people/id=QzskgUlMvl", 'x-li-format' => 'json').body
# returns all names and ids of people who have keyword of X
# 
json_txt = access_token.get("http://api.linkedin.com/v1/people-search?keywords=Google",'x-li-format' => 'json').body
# returns name and id of all people who work at a company
# company_employees (slightly altered)
json_txt = access_token.get("https://api.linkedin.com/v1/people-search?company-name=The%20Flatiron%20School&current-company=true&sort=connections", 'x-li-format' => 'json').body
# returns company name and id with email domain
# find_company_profile(email)
json_txt = access_token.get("https://api.linkedin.com/v1/companies?email-domain=accenture.com", 'x-li-format' => 'json').body
# returns id name description industry size type and logo-url of company
# 
json_txt = access_token.get("http://api.linkedin.com/v1/companies/2677373:(id,name,industry)", 'x-li-format' => 'json').body
