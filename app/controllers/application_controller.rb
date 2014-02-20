class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session
  before_filter :configure_permitted_parameters, if: :devise_controller?
  skip_before_filter :verify_authenticity_token, :if => Proc.new { |c| c.request.format == 'application/json' }

	protected	  
	  def configure_permitted_parameters
	  	additional_user_params = [:name, :lastname, :gender, :phone, :birthday, :yandex]
	  	additional_user_params.each do |param|
	    	devise_parameter_sanitizer.for(:sign_up) << param
	    end
	  end

	  def after_sign_in_path_for(user)
		if current_user.role == "agent"
			staticpages_show_path
		else
			super
		end
	  end

end
