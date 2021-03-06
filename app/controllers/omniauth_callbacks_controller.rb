class OmniauthCallbacksController < Devise::OmniauthCallbacksController

	def linkedin
		user = User.from_omniauth(request.env["omniauth.auth"])
		if user.persisted?
			flash.notice = "Signed in w/ LinkedIn"
			# sign_in_and_redirect "#/view"
			sign_in_and_redirect user
		else
			session["devise.user_attributes"] = user.attributes
			redirect_to new_user_registration_url # "#/view" 
		end
	end
end


