class CompaniesController < ApplicationController
  before_action :set_company, only: [:show, :edit, :update, :destroy]

  # GET /companies
  # GET /companies.json
  def index
    render html: cell(IndexCell, items: Company.all, model_name: 'company',
      attributes: [:name, :city], notice: notice)
  end

  # GET /companies/1
  # GET /companies/1.json
  def show
    render html: cell(ShowCell, item: @company, model_name: 'company',
      attributes: [:name, :city], notice: notice)
  end

  # GET /companies/new
  def new
    render html: cell(NewCell, item: Company.new, model_name: 'company',
      attributes: [:name, :city])
  end

  # GET /companies/1/edit
  def edit
    render html: cell(EditCell, item: @company, model_name: 'company',
      attributes: [:name, :city], notice: notice)
  end

  # POST /companies
  # POST /companies.json
  def create
    @company = Company.new(company_params)

    respond_to do |format|
      if @company.save
        format.html { redirect_to @company, notice: 'Company was successfully created.' }
        format.json { render :show, status: :created, location: @company }
      else
        format.html { render :new }
        format.json { render json: @company.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /companies/1
  # PATCH/PUT /companies/1.json
  def update
    respond_to do |format|
      if @company.update(company_params)
        format.html { redirect_to @company, notice: 'Company was successfully updated.' }
        format.json { render :show, status: :ok, location: @company }
      else
        format.html { render :edit }
        format.json { render json: @company.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /companies/1
  # DELETE /companies/1.json
  def destroy
    @company.destroy
    respond_to do |format|
      format.html { redirect_to companies_url, notice: 'Company was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_company
      @company = Company.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def company_params
      params.require(:company).permit(:name, :city)
    end
end
