class BookingsController < ApplicationController
  before_action :set_activity, only: [:create]
  before_action :set_booking, only: [:show, :edit, :update, :destroy]

  def index
    @bookings = Booking.all
  end

  def show
    @booking = Booking.find(params[:id])
    @activity = @booking.activity
    @activity = @booking.activity
    @start_date = params.fetch(:start_date, @booking.start_date).to_date
  end

  def edit
    @booking = Booking.find(params[:id])
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.activity_id = @activity.id
    @booking.user = current_user
    if @booking.save!
      redirect_to booking_path(@booking), notice: 'Reservation was successfully created.'
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
    @activity = Activity.find(params[:activity_id].to_i)
  end

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def booking_params
    params.require(:booking).permit(:first_name, :last_name, :email, :phone_number, :start_date, :end_date, :adults, :children)
  end
end
