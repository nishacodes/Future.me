# This file is used by Rack-based servers to start the application.

require ::File.expand_path('../config/environment',  __FILE__)
run Futureme::Application

I18n.enforce_available_locales = false