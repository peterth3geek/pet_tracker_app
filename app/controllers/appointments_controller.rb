class AppointmentsController < ApplicationController
  def new
    @appointment = Appointment.new
    @owner = current_user
  end

  def create
    @appointment = Appointment.new(appointment_params)
    if @appointment.save
      redirect_to @appointment
    else
      render :new
    end
  end

  private

  def find_appointment
    Appointment.find(params[:id])
  end

  def appointment_params
    params.require(:appointment).permit(:pet_id, :title, :notes, :date, :owner_id)
  end

end
