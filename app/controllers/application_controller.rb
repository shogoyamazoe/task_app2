class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters, if: :devise_controller?
    
    before_action :set_search

  def set_search
    @search = Room.ransack(params[:q])
    @rooms = @search.result
  end


    def after_sign_in_path_for(resource)
        root_path
      end

    
    def after_sign_out_path_for(resource)
      root_path
    end 

      private
          def sign_in_required
              redirect_to new_user_session_url unless user_signed_in?
          end

          def configure_permitted_parameters
            devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :image]) 
            devise_parameter_sanitizer.permit(:account_update, keys: [:username])
          end

 
end
