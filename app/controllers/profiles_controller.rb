class ProfilesController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :toggle_location]

  def show
  end

  def edit
  end

  def update
    raise
    if @profile.update(profile_params)
      redirect_to profile_path(@profile), notice: 'Profil mis à jour avec succès.'
    else
      render :edit
    end
  end

  def toggle_location
    # @profile = Profile.find(params[:id])
    @profile.update(share_location: params[:profile][:share_location])
    redirect_to profile_path(@profile), notice: 'Le statut de partage de la localisation a été mis à jour.'
  end

  private

  def profile_params
    params.require(:profile).permit(:nickname, :email, :photo, :share_location, :description, :address)
  end

  def set_user
    @profile = current_user.profile
    # @user = current_user
  end

end
