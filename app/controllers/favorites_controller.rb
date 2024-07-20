class FavoritesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_favorite, only: [:destroy]

  def index
    @favorites = current_user.favorites.includes(:activity)
  end

  def create
    @activity = Activity.find(params[:activity_id])
    @favorite = Favorite.new(user: @current_user, activity: @activity)
    @favorite.save
    redirect_to activities_path(city: params[:city]), notice: "Favorie ajouté!"
  end

  def destroy
    @favorite = Favorite.find(params[:id]).destroy
    redirect_to favorites_path, notice: "Supprimé!", status: :see_other
  end

  private

  def set_favorite
    @favorite = current_user.favorites.find(params[:id])
  end

  def favorite_params
    params.require(:favorite).permit(:activity_id, :title, :descritption)
  end
end
