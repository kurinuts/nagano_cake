class ApplicationController < ActionController::Base
  def after_sign_in_path_for(resource)
    case resource
    when Customer
      customers_show_path
    when Admin
      admins_show_path
    end
  end
end
