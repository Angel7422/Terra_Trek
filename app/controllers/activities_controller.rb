class ActivitiesController < ApplicationController
  def index
    @activities = Activity.all
    if params[:city].present?
      @activities = @activities.near(params[:city], 50)
    end
    @markers = @activities.geocoded.map do |activity|
      {
        lat: activity.latitude,
        lng: activity.longitude
      }
    end
  end

  def show
    @activity = Activity.find(params[:id])
    @booking = Booking.new # Add this line to instantiate the form on the show
  end

  def new
    @activity = Activity.new
  end

  def create
    @activity = Activity.new(activity_params)
    @activity.user = current_user
    if @activity.save
      redirect_to activity_path(@activity)
    else
      render :new
    end
  end

  def edit
    @activity = Activity.find(params[:id])
  end

  def update
    @activity = Activity.find(params[:id])
    @activity.update(activity_params)
    redirect_to activity_path(@activity)
  end

  def destroy
    @activity = Activity.find(params[:id])
    @activity.destroy
    redirect_to activities_path
  end

  private

  def activity_params
    params.require(:activity).permit(:name, :address, :description, pictures:[])
  end
end
