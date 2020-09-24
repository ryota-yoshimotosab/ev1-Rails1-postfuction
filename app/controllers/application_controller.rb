class ApplicationController < ActionController::Base
    

 layout :layout_by_resource 
 
 def layout_by_resource 
   if devise_controller?
       "nosidebar"
   else 
       "application"
   end
     
 end
 
 
 before_action :configure_permitted_parameters, if: :devise_controller?
 protected 
 def configure_permitted_parameters 
 devise_parameter_sanitizer.permit(:account_update, 
 keys: [:username, :profile, :profileimage])
end 
 
 
 def admin_authenticate
  if user_signed_in? && current_user.id > 1
  redirect_to new_contact_path
  end 
end 
    
    
end
