class BookingsController < ApplicationController
  before_action :set_activity, only: [:new, :create]
  before_action :set_booking, only: [:show, :edit, :update, :destroy]

  def index
    @bookings = Booking.all
  end

  def show
    @booking = Booking.find(params[:id])
  end

  def new
    @booking = Booking.new
    if request.xhr?
      render partial: 'form', locals: { activity: @activity, booking: @booking }, layout: false
    else
      render :new
    end
  end

  def edit
    @booking = Booking.find(params[:id])
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.activity = @activity
    @booking.user = current_user
    if @booking.save
      redirect_to activity_path(@activity)
    else
      render :new
    end
  end

  def update
    @booking = Booking.find(params[:id])
    @booking.update(booking_params)
    redirect_to activity_path(@booking.activity)
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
    redirect_to activity_path(@booking.activity)
  end

  private

  def set_activity
    @activity = Activity.find(params[:activity_id])
  end

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def booking_params
    params.require(:booking).permit(:date)
  end
end
