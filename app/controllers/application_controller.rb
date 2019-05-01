class ApplicationController < ActionController::Base
	before_action :authenticate_user!
	
	rescue_from CanCan::AccessDenied do |exception|
  		redirect_to welcome_index_url, :alert => exception.message
	end

end
