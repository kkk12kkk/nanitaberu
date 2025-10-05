class ApplicationController < ActionController::Base
  # top about アクションを除いてauthenticate_user（ログイン）チェックをする
  before_action :authenticate_user!, except: [:top, :about]
  # devise_controllerアクションだった場合configure_permitted_parameters実行（サインアップ時にネームカラムを受け取る）
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource)
    taberus_path(current_user)
  end

  def after_sign_out_path_for(resource)
    about_path
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end

end