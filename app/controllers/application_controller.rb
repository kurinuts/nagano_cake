class ApplicationController < ActionController::Base
  def after_sign_in_path_for(resource)
    case resource
    when Customer
      customers_path
    when Admin
      admins_path
    end
  end
end
