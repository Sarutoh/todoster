class ApplicationController < ActionController::Base
	before_action :redirect_to_sign_in

	def redirect_to_sign_in
		redirect_to :new_user_session if !user_signed_in? &&
																		 !request.path.include?('users')
	end 
end
