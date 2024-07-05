class ApplicationController < ActionController::Base
  before_action :authenticate_user!, :set_current_user

  private

  def set_current_user
    @user = current_user
  end

end
