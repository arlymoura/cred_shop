class ProponentsController < ApplicationController
  before_action :set_proponent, only: %i[ show edit update destroy ]

  def index
    @proponents = Proponent.includes(:financial_info).page(params[:page]).per(5)
  end

  def show
  end

  def new
    @proponent = Proponent.new(
      address: Address.new,
      phones: [Phone.new(phone_type: :reference)],
      financial_info: FinancialInfo.new
    )
  end

  def edit
  end

  def create
    @proponent = Proponent.new(proponent_params)

    respond_to do |format|
      if @proponent.save
        format.html { redirect_to @proponent, notice: "Proponent was successfully created." }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @proponent.update(proponent_params)
        format.html { redirect_to @proponent, notice: "Proponent was successfully updated." }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @proponent.destroy

    respond_to do |format|
      format.html { redirect_to proponents_path, status: :see_other, notice: "Proponent was successfully destroyed." }
    end
  end

  def calculate_inss
    salary = params[:salary].to_f
    inss = FinancialInfos::InssCalculator.call(salary)
    render json: { inss: inss }
  rescue ArgumentError => e
    render json: { error: e.message }, status: :unprocessable_entity
  end

  private
    def set_proponent
      @proponent = Proponent.find(params[:id])
    end

    def proponent_params
      params.require(:proponent).permit(
        :name, :cpf, :date_of_birth,
        address_attributes: %i[id street number neighborhood city state zip_code],
        financial_info_attributes: %i[id salary inss_discount],
        phones_attributes: %i[id phone_number phone_type]
      )
    end
end
