Rails.application.config.middleware.use OmniAuth::Builder do
  provider :developer unless Rails.env.production?
  provider :linked_in, '77ze1x9zbqkfe7', 'vnVI2BZxFEm8QxNM'
end