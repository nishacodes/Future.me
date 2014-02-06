class ApplicationController < ActionController::Base
  protect_from_forgery
  after_filter :set_access_control_headers

  def index

  end

	def set_access_control_headers 
		headers['Access-Control-Allow-Origin'] = 'null'
		headers['Access-Control-Request-Method'] = '*' 
	end

end
