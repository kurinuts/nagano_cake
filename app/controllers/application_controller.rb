class ApplicationController < ActionController::Base
  def after_sign_in_path_for(resource)
    case resource
    when Customer
      root_path(resource)
    when Admin
      admin_homes_path(resource)
    end
  end

  def after_sign_out_path_for(resource)
    case resource
    when :admin
      new_admin_session_path # ログアウト後に遷移するpathを設定
    when :customer
      root_path
    end
  end
end
