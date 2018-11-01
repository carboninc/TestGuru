class ApplicationController < ActionController::Base
  def after_sign_in_path_for(resource)
    flash[:notice] = "Привет, #{resource.first_name} #{resource.last_name}"
    if resource.is_a?(Admin)
      admin_tests_path
    else
      root_path
    end
  end
end
