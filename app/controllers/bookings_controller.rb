class BookingsController < ApplicationController
  def index
    @bookings = Booking.all
  end

  def create
    @workout = Workout.find(params[:workout_id])
    @booking = Booking.new(bookings_params)
    @instructor = @workout.instructor
    @booking.workout = @workout
    @booking.user = current_user
    @booking.save
    if @booking.save
      redirect_to dashboard_path, notice: 'Booking saved!'
    else
      render "workouts/show", status: :unprocessable_entity
    end
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
  end

  private

  def bookings_params
    params.require(:booking).permit(:date)
  end
end
