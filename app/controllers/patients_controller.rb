class PatientsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_patient, only: %i[ show edit update destroy ]
  before_action :set_breadcrumbs

  def index
    @patients = Patient.all
    authorize @patients
  end

  def new
    @patient = Patient.new
    authorize @patient
  end

  def create
    @patient = Patient.new(patient_params)
    authorize @patient
    respond_to do |format|
      if @patient.save
        format.html { redirect_to patients_url, notice: "Patient was successfully Created." }
      else
        format.html {render :new, status: :unprocessable_entity }
      end
    end
  end

  def show
    authorize @patient
    start_date = params.fetch(:start_date, Date.today).to_date
    @appointments = @patient.appointments.where(start_time: start_date.beginning_of_month.beginning_of_week..start_date.end_of_month.end_of_week)
  end

  def edit
    authorize @patient
  end

  def update
    authorize @patient
    respond_to do |format|
      if @patient.update(patient_params)
        format.html { redirect_to patients_url, notice: "Patient was successfully updated." }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    authorize @patient
    @patient.destroy
    respond_to do |format|
      format.html { redirect_to specialities_url, notice: "Patient was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_patient
      @patient = Patient.find(params[:id])
    end

    def set_breadcrumbs
      add_breadcrumb("Patients", patients_path)
      add_breadcrumb("Add Patient", new_patient_path) if action_name == "new"
      add_breadcrumb("Edit #{@patient.first_name}") if action_name == "edit"
    end

    # Only allow a list of trusted parameters through.
    def patient_params
      params.require(:patient).permit(:first_name, :last_name, :email, :password, :image, :phone, :address)
    end
end
