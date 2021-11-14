class ApplicationController < ActionController::Base
  def after_sign_in_path_for(resource)
    user_path(resource)
  end

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected
  def configure_permitted_parameters
    # 新規登録時にnameの取得を許可
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    # 情報更新時にnameの取得を許可
    devise_parameter_sanitizer.permit(:account_update, keys: [:name])
  end

  def set_user
    @user = User.find(params[:id])
  end
end
