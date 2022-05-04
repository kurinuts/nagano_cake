class ApplicationController < ActionController::Base
  def after_sign_in_path_for(resource)
    case resource
    when Customer
      customer_path(resource)
    when Admin
      admin_homes_path(resource)
    end
  end

  # def after_sign_out_path_for(resource)
  #   case resource
  #   when Admin
  #     new_user_session_path # ログアウト後に遷移するpathを設定
  #   end
  # end
end
