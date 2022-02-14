class ApplicationController < ActionController::Base
    before_action :authenticate_user!
    before_action :set_user, if: :user_signed_in?
private
    def set_user
        cookies[:username] = current_user.id
    end

end
