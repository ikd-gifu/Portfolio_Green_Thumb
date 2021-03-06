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
      flash[:success] = "#{@material_stock_table.material_name}の資材在庫表の作成に成功しました。"
      redirect_to user_material_stock_table_index_path
    else
      #flash[:alert] = "資材在庫表を作成できませんでした。"
      render :new
      # redirect_to new_user_material_stock_table_path(current_user), alert: "資材在庫表を作成できませんでした。"
    end
  end

  def edit
    @material_stock_table = MaterialStockTable.find(params[:id])
  end

  def update
    @material_stock_table = MaterialStockTable.find(params[:id])
    if @material_stock_table.update(material_stock_table_params)
      flash[:success] = "#{@material_stock_table.material_name}の資材在庫表を更新しました。"
      redirect_to user_material_stock_table_index_path(current_user)
    else
      flash[:danger] = "資材在庫表の更新は失敗しました。"
      redirect_to user_material_stock_table_index_path(current_user)
    end
  end

  def destroy
    @material_stock_table = MaterialStockTable.find(params[:id])
    @material_stock_table.destroy
    flash[:success] = "#{@material_stock_table.material_name}の資材在庫表を削除しました。"
    redirect_to user_material_stock_table_index_path(current_user)
  end

  private

    def material_stock_table_params
      params.require(:material_stock_table).permit(:user_id, :material_name, :material_price, :material_size, :material_quantity, :material_purchase_date, :material_purchase_location)
    end
end
