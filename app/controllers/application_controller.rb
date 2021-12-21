class ApplicationController < ActionController::Base
  add_flash_types :success, :info, :warning, :danger

  def after_sign_in_path_for(resource)
    user_path(resource)
  end

  # def after_update_path_for(resource)
  #   user_path(resource) #ここにリダイレクト先のパスを指定
  # end

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected
  def configure_permitted_parameters
    # 新規登録時にnameの取得を許可
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :location_id])
    # 情報更新時にnameの取得を許可
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :location_id])
  end

  def set_user
    @user = User.find(params[:id])
  end

  def set_plant_management_slip
    @plant_management_slip = PlantManagementSlip.find(params[:id])
  end
end
