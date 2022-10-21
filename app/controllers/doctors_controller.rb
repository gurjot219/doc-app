class DoctorsController < ApplicationController
  before_action :set_doctor, only: %i[ show edit update destroy ]

  def index
    @doctors = Doctor.all
  end

  def new
    @specialities = Speciality.all
    @doctor = Doctor.new
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

  end

  def edit
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

  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_doctor
      @doctor = Doctor.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def doctor_params
      params.require(:doctor).permit(:first_name, :last_name, :email, :password, :speciality_id, :image, :status)
    end

end
