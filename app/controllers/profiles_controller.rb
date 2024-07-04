class ProfilesController < ApplicationController
  before_action :set_user, only: [:show, :toggle_location]

  def show
    @profile = @user.profile
    # @user = User.find(params[:id])
  end

  def edit
    @profile = @user.profile
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to profile_path(@user)
  end

  def toggle_location
    @profile.update(share_location: params[:proile][:share_location])
    redirect_to @profile, notice: "Location shared status updated"
  end

  private

  def user_params
    params.require(:user).permit(:nickname, :email, :photo)
  end

  def set_user
    @user = current_user
  end

end
