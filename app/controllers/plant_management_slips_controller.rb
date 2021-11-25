class PlantManagementSlipsController < ApplicationController
  before_action :set_plant_management_slip, only: [:show, :edit, :update, :destroy]

  def index
    @plant_basic_data = PlantBasicDatum.where(user_id: params[:user_id])
    @plant_management_slips = PlantManagementSlip.where(plant_basic_datum_id: @plant_basic_data.id).paginate(page: params[:page], per_page: 3)
  end

  def new
    @plant_management_slip = PlantManagementSlip.new(user_id: params[:user_id])
  end

  def show
  end

  def create
    @plant_management_slip = PlantManagementSlip.new(plant_management_slip_params)
    if @plant_management_slip.save
      redirect_to user_plant_management_slips_path, notice: "植物管理票の新規作成に成功しました。"
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @plant_management_slip.update(plant_management_slip_params)
      redirect_to user_plant_management_slip_path(), notice: "#{@plant_management_slip.plant_name}の管理票を更新しました。"
    else
      redirect_to user_plant_management_slips_path(), notice: "#{@plant_management_slip.plant_name}の管理票の更新に失敗しました。"
    end
  end

  def destroy
    @plant_management_slip.destroy
    redirect_to user_plant_management_slip_path(), notice: "#{@plant_management_slip.plant_name}の管理票を削除しました。"
  end

  private

    def plant_management_slip_params
      params.require(:plant_management_slip).permit(:plant_basic_datum_id, :plant_name, :plant_price, :plant_size, :plant_quantity, :plant_purchase_date, :plant_purchase_location)
    end

end
