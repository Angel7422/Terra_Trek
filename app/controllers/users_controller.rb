class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: [:show, :edit, :update]

  def show
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to @user, notice: 'Profil mis à jour avec succès.'
    else
      render :edit
    end
  end

  def near_me
    @users = User.find(params[:id])
    @users = User.all
  end

  private

  def set_user
    @user = current_user
  end

  def user_params
    params.require(:user).permit(:nickname, :address, :description, :email)
  end
end
