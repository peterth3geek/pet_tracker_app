class AppointmentsController < ApplicationController
  def index
  end

  def new
    @appointment = Appointment.new
    @owner = current_user
  end

  def create
    # binding.pry
    @appointment = Appointment.new(appointment_params)
    if @appointment.save
      redirect_to @appointment
    else
      render :new
    end
  end

  def show
    @appointment = find_appointment
  end

  def edit
    @appointment = find_appointment
  end

  def update
    @appointment = find_appointment
    if @appointment.update(appointment_params)
      redirect_to @appointment
    else
      render :edit
    end
  end

  def destroy
    @appointment = find_appointment
    @appointment.destroy

    redirect_to owner_path(current_user)
  end

  private

  def find_appointment
    Appointment.find(params[:id])
  end

  def appointment_params
    params.require(:appointment).permit(:pet_id, :title, :notes, :time, :owner_id)
  end

end
