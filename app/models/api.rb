class Api
  attr_accessor :company_id, :company_name, :company_industry, :company_postalcode

  CONSUMER = OAuth::Consumer.new("77ze1x9zbqkfe7", "vnVI2BZxFEm8QxNM")
  ACCESS_TOKEN = OAuth::AccessToken.new(CONSUMER, "e974f1f1-9f42-4ab0-af97-b32bd6229e22", 
    "f732020e-436c-4b34-882c-c29973bfb5e3")
  FIELDS = ['id', 'first-name', 'last-name', 'public-profile-url', 'site-standard-profile-request', 'headline', 'industry', 'distance', 'num-connections', 'positions', 'educations', 'member-url-resources'].join(',')

  # generalize this thing i keep doing over and over. method would take two arguments: url and hash of k-v pairs
  def get_admin
    json_txt = ACCESS_TOKEN.get("http://api.linkedin.com/v1/people/~:(#{FIELDS})", 'x-li-format' => 'json').body
    parsed = JSON.parse(json_txt)
    create_person(parsed)
    # returns all FIELDS
  end

  def get_person(id)
    json_txt = ACCESS_TOKEN.get("http://api.linkedin.com/v1/people::(id=#{id}):(#{FIELDS})", 'x-li-format' => 'json').body
    parsed = JSON.parse(json_txt)
    create_person(parsed)
    # returns some FIELDS
  end

  def create_person(parsed)
    firstname = parsed["firstName"]
    lastname = parsed["lastName"]
    linkedin_id = parsed["id"]
    Person.create(:firstname => firstname, :lastname => lastname, :linkedin_id => linkedin_id)
  end

  def find_company(email)
    json_txt = ACCESS_TOKEN.get("https://api.linkedin.com/v1/companies?email-domain=#{email}", 'x-li-format' => 'json').body
    parsed = JSON.parse(json_txt)["values"][0]
    @company_id = parsed["id"]
    @company_name = parsed["name"]
    company_details
  end

  def company_details
    json_txt = ACCESS_TOKEN.get("http://api.linkedin.com/v1/companies/#{@company_id}:(name,industries,company-type,locations,website-url,employee-count-range)", 'x-li-format' => 'json').body
    parsed = JSON.parse(json_txt)
    @company_industry = parsed["industries"]["values"][0]["name"]
    @company_postalcode = parsed["locations"]["values"][0]["address"]["postalCode"]
    company_employees
  end

  def company_employees
    i = 0
    json_txt = ACCESS_TOKEN.get("https://api.linkedin.com/v1/people-search:(people:(public-profile-url))?company-id=#{@company_id}&current-company=true&sort=connections&count=10&start=#{i}", 'x-li-format' => 'json').body
    parsed = JSON.parse(json_txt)
  end
  
end