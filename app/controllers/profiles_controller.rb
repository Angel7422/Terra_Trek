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
    @profile = Profile.find(params[:id])
    if @profile.update(profile_params)
      redirect_to profile_path(@profile), notice: 'Profil mis à jour avec succès.'
    else
      render :edit
    end
  end

  def toggle_location
    @profile = Profile.find(params[:id])
    @profile.update(share_location: params[:profile][:share_location])
    redirect_to profile_path(@profile), notice: 'Le statut de partage de la localisation a été mis à jour.'
  end

  private

  def profile_params
    params.require(:profile).permit(:nickname, :email, :photo, :share_location)
  end

  def set_user
    @user = current_user
  end

end
