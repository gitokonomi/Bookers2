class ApplicationController < ActionController::Base
  
  # devise利用の機能前に下記メソッド
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sigh_in_path_for(resource)
    root_path
  end

  def after_sigh_out_path_for(resource)
    root_path
  end





  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end

end
