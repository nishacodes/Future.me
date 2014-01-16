class PagesController < ApplicationController
  
  def index
    @company = Company.create(:name=>"Google")
    # @company.get_user_profile()

  end
end
