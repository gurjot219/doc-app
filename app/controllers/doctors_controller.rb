class DoctorsController < ApplicationController
  before_action :set_doctor, only: %i[ show edit update destroy ]
  before_action :set_breadcrumbs


  def index
    @doctors = Doctor.all
  end

  def new
    @specialities = Speciality.all
    @doctor = Doctor.new
    authorize @doctor
  end

  def create
    @doctor = Doctor.new(doctor_params)
    respond_to do |format|
      if @doctor.save
        format.html { redirect_to doctors_url, notice: "Doctor was successfully Created." }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def show
    @appointment = Appointment.new
    start_date = params.fetch(:start_date, Date.today).to_date
    @appointments = Appointment.where(start_time: start_date.beginning_of_month.beginning_of_week..start_date.end_of_month.end_of_week)
  end

  def edit
    authorize @doctor
    @specialities = Speciality.all
  end

  def update
    respond_to do |format|
      if @doctor.update(doctor_params)
        format.html { redirect_to doctors_url, notice: "Doctor was successfully updated." }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    authorize @doctor
    @doctor.destroy

    respond_to do |format|
      format.html { redirect_to specialities_url, notice: "Doctor was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_doctor
      @doctor = Doctor.find(params[:id])
    end

    def set_breadcrumbs
      add_breadcrumb("Doctors", doctors_path)
      add_breadcrumb("Add Doctor", new_doctor_path) if action_name == "new"
      add_breadcrumb("Edit #{@doctor.first_name}") if action_name == "edit"

    end

    # Only allow a list of trusted parameters through.
    def doctor_params
      params.require(:doctor).permit(:first_name, :last_name, :email, :password, :speciality_id, :image, :status)
    end

end
