class SpecialitiesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_speciality, only: %i[ show edit update destroy ]
  before_action :set_breadcrumbs

  # GET /specialities or /specialities.json
  def index
    @specialities = Speciality.all
    @speciality = Speciality.new
  end

  # GET /specialities/1 or /specialities/1.json
  def show
  end

  # GET /specialities/new
  def new
    @speciality = Speciality.new
    authorize @speciality
  end

  # GET /specialities/1/edit
  def edit
    authorize @speciality
  end

  # POST /specialities or /specialities.json
  def create
    flag = false
    @speciality = Speciality.find_by(id: speciality_params[:id])

    if @speciality.nil?
      @speciality = Speciality.new(speciality_params)
      authorize @speciality
      flag = true if @speciality.save
    else
      authorize @speciality, :update?
      flag = true if @speciality.update(speciality_params)
    end

    respond_to do |format|
      if flag
        format.html { redirect_to specialities_url, notice: "Speciality was successfully Saved." }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /specialities/1 or /specialities/1.json
  def update
    authorize @speciality
    respond_to do |format|
      if @speciality.update(speciality_params)
        format.html { redirect_to speciality_url(@speciality), notice: "Speciality was successfully updated." }
        format.json { render :show, status: :ok, location: @speciality }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @speciality.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /specialities/1 or /specialities/1.json
  def destroy
    authorize @speciality
    @speciality.destroy

    respond_to do |format|
      format.html { redirect_to specialities_url, notice: "Speciality was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

    def set_breadcrumbs
      add_breadcrumb("Specialities", specialities_path)
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_speciality
      @speciality = Speciality.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def speciality_params
      params.require(:speciality).permit(:name, :image, :id)
    end
end
