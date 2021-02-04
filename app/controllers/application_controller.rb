class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters, if: :devise_controller?
    before_action :set_day

    private
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, 
                                        keys: [:nickname, :first_name, :last_name, :first_name_kana, :last_name_kana])
    end

    def set_day
      config.beginning_of_week = :sunday
    end
end
