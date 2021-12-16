class MaterialStockTableController < ApplicationController
  before_action :authenticate_user! , only: [:index, :show, :new, :create, :edit, :update, :destroy]

  def index
    # @material_stock_tables = MaterialStockTable.where(user_id: params[:user_id]).paginate(page: params[:page], per_page: 10)
    @material_stock_tables = current_user.material_stock_tables.paginate(page: params[:page], per_page: 10)
  end

  def show
    @material_stock_table = MaterialStockTable.find(params[:id])
  end

  def new
    @material_stock_table = MaterialStockTable.new(user_id: params[:user_id])
  end

  def create
    @material_stock_table = MaterialStockTable.new(material_stock_table_params)
    if @material_stock_table.save
      redirect_to user_material_stock_table_index_path, notice: "資材在庫表の作成に成功しました。"
    else
      #flash[:alert] = "資材在庫表を作成できませんでした。"
      #render :new
      redirect_to new_user_material_stock_table_path(current_user), alert: "資材在庫表を作成できませんでした。"
    end
  end

  def edit
    @material_stock_table = MaterialStockTable.find(params[:id])
  end

  def update
    @material_stock_table = MaterialStockTable.find(params[:id])
    if @material_stock_table.update(material_stock_table_params)
      redirect_to user_material_stock_table_index_path(current_user), notice: "#{@material_stock_table.material_name}の基本情報を更新しました。"
    else
      redirect_to user_material_stock_table_index_path(current_user), alert: "基本情報の更新に失敗しました。"
    end
  end

  def destroy
    @material_stock_table = MaterialStockTable.find(params[:id])
    @material_stock_table.destroy
    redirect_to user_material_stock_table_index_path(current_user), notice: "#{@material_stock_table.material_name}のデータを削除しました。"
  end

  private

    def material_stock_table_params
      params.require(:material_stock_table).permit(:user_id, :material_name, :material_price, :material_size, :material_quantity, :material_purchase_date, :material_purchase_location)
    end
end
