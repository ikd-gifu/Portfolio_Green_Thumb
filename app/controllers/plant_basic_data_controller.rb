class PlantBasicDataController < ApplicationController
  before_action :authenticate_user! , only: [:index, :show, :new, :create, :edit, :update, :destroy]
  # before_action :set_user, only: [:new]

  def index
    # @plant_basic_data = PlantBasicDatum.where(user_id: params[:id])
    #@plant_basic_data = PlantBasicDatum.where(user_id: params[:user_id]).paginate(page: params[:page], per_page: 3)
    @plant_basic_data = current_user.plant_basic_data.paginate(page: params[:page], per_page: 10)
  end

  def show
    @plant_basic_datum = PlantBasicDatum.find(params[:id])
  end

  def new
    @plant_basic_datum = PlantBasicDatum.new(user_id: params[:user_id])
  end

  def create
    @plant_basic_datum = PlantBasicDatum.new(plant_basic_datum_params)
    if @plant_basic_datum.save
      flash[:success] = "#{@plant_basic_datum.plant_name}の基本情報の作成に成功しました。"
      redirect_to user_plant_basic_data_path
      # flash[:success] = '植物基本情報の作成に成功しました。'
    else
      render :new
    end
  end

  def edit
    @plant_basic_datum = PlantBasicDatum.find(params[:id])
  end

  def update
    @plant_basic_datum = PlantBasicDatum.find(params[:id])
    if @plant_basic_datum.update(plant_basic_datum_params)
      flash[:success] = "#{@plant_basic_datum.plant_name}の基本情報を更新しました。"
      # redirect_to user_plant_basic_data_path(current_user), notice: "#{@plant_basic_datum.plant_name}の基本情報を更新しました。"
      redirect_to user_plant_basic_data_path(current_user)
    else
      # render :edit
      flash[:danger] = "植物基本情報の更新は失敗しました。<br>" + @plant_basic_datum.errors.full_messages.join("<br>。")
      redirect_to user_plant_basic_data_path(current_user)
    end
  end

  def destroy
    @plant_basic_datum = PlantBasicDatum.find(params[:id])
    @plant_basic_datum.destroy
    flash[:success] = "#{@plant_basic_datum.plant_name}の基本情報を削除しました。"
    redirect_to user_plant_basic_data_path(current_user)
  end

  private

    def plant_basic_datum_params
      params.require(:plant_basic_datum).permit(:user_id, :plant_name, :plant_breed_name, :plant_family_name, :plant_alias, :plant_scientific_name, :plant_place_of_origin, :characteristics_applications)
    end

end
