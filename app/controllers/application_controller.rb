class ApplicationController < ActionController::Base
  protect_from_forgery

  def index
    @company = Company.new
    @company.save
  end


end
