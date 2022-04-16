class ApplicationController < ActionController::Base
  def after_sign_in_path_for(resource)
    case resource
    when Customer
      customer_path
    when Admin
      admin_homes_path
    end
  end
end
