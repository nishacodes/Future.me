# Rails.application.config.middleware.use OmniAuth::Builder do
#   provider :developer unless Rails.env.production?
#   provider :linkedin, '77ze1x9zbqkfe7', 'vnVI2BZxFEm8QxNM', :scope => 'r_fullprofile r_emailaddress r_network', :fields => ['id', 'email-address', 'first-name', 'last-name']
# end