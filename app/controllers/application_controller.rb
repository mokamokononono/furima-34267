class ApplicationController < ActionController::Base
  before_action :basic_auth
  before_action :configure_permitted_parameters, if: :devise_controller?
  
  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(
      :sign_up, keys: [:nick_name, :kanji_family_name, :kanji_given_name, :katakana_family_name, :katakana_given_name, :date_of_birth]
    )
  end

  private
  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV["BASIC_AUTH_USER"] && password == ENV["BASIC_AUTH_PASSWORD"]
    end
  end
end
