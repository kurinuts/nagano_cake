class ApplicationController < ActionController::Base
  def after_sign_in_path_for(resource)
    case resource
    when Customer
      customer_path(resource)
    when Admin
      admin_homes_path(resource)
    end
  end
end
