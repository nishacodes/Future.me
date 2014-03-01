class OmniauthCallbacksController < Devise::OmniauthCallbacksController

	def linkedin
		user = User.from_omniauth(request.env["omniauth.auth"])
		if user.persisted?
			debugger
			flash.notice = "Signed in w/ LinkedIn"
			sign_in_and_redirect "#/view"
		else
			session["devise.user_attributes"] = user.attributes
			redirect_to "#/view" #new_user_registration_url
		end
	end
end


