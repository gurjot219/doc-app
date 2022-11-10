class AppointmentsController < ApplicationController

  def create
    @appointment = Appointment.new(appointment_params)
    @appointment.patient_id = 3
    if @appointment.save
      redirect_to doctors_path
    end
  end

  private

  # Only allow a list of trusted parameters through.
  def appointment_params
    params.require(:appointment).permit(:title, :description, :doctor_id, :start_time, :end_time)
  end
end
