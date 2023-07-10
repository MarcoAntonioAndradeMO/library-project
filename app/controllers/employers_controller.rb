class EmployersController < ApplicationController
  before_action :set_employer, only: %i[ show edit update destroy ]

  # GET /employers or /employers.json
  def index
    @employers = Employer.all
    @loan_count = Hash.new(0)

    start_date = params[:start_date]
    end_date = params[:end_date]

    if start_date.present? && end_date.present?
      start_date = DateTime.parse(start_date)
      end_date = DateTime.parse(end_date)
      @employers = Employer.where("effectuation_date <= ?", end_date)
      @employers = @employers.where("resignation_date IS NULL OR resignation_date > ?", end_date)
    else
      @employers = Employer.all
    end

    @employers.each do |employer|
      @loan_count[employer.id] = employer.loans.count
    end

  end

  # GET /employers/1 or /employers/1.json
  def show
    @employer = Employer.find(params[:id])
    @loan_count = @employer.loans.size
  end

  # GET /employers/new
  def new
    @employer = Employer.new
  end

  # GET /employers/1/edit
  def edit
  end

  # POST /employers or /employers.json
  def create
    @employer = Employer.new(employer_params)

    respond_to do |format|
      if @employer.save
        format.html { redirect_to employer_url(@employer), notice: "Employer was successfully created." }
        format.json { render :show, status: :created, location: @employer }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @employer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /employers/1 or /employers/1.json
  def update
    respond_to do |format|
      if @employer.update(employer_params)
        format.html { redirect_to employer_url(@employer), notice: "Employer was successfully updated." }
        format.json { render :show, status: :ok, location: @employer }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @employer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /employers/1 or /employers/1.json
  def destroy
    @employer.destroy

    respond_to do |format|
      format.html { redirect_to employers_url, notice: "Employer was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_employer
      @employer = Employer.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def employer_params
      params.require(:employer).permit(:proper_name, :function, :effectuation_date, :resignation_date, :loan)
    end
end
