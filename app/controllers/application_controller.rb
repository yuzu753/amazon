class ApplicationController < ActionController::Base

 before_action :authenticate_user!

 def after_sign_in_path_for(resource)
      user_path(current_user)
 end

 def after_sign_out_path_for(resource)
     '/'
 end

 def authenticate_user

if @current_user == nil

redirect_to("/login")

end

end


 protected

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email])
      devise_parameter_sanitizer.permit(:sign_in, keys: [:name])
    end

end
