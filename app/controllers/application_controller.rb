class ApplicationController < ActionController::Base
    before_action :set_user
private

  def set_user
cookies[:username] = current_user.id || 'guest'
  end
end
