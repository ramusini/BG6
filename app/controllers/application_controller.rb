class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  # before_action :authenticate_user!, except: [:top] 

  # ログイン後の画面を記録一覧へ
  # def after_sign_in_path_for(resource)
  #   #records_path
  # end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :postal_code, :prefecture, :city, :age])
  end

end
