class PlantBasicDataController < ApplicationController


  def index
    # @plant_basic_data = PlantBasicDatum.where(user_id: params[:id])
    @plant_basic_data = PlantBasicDatum.where(user_id: params[:id]).paginate(page: params[:page], per_page: 1)
  end

  def show
  end

  def new
    @plant_basic_datum = PlantBasicDatum.new
  end

  def create
    @plant_basic_datum = PlantBasicDatum.new(plant_basic_datum_params)
    if @plant_basic_datum.save
      flash[:success] = '植物基本情報の作成に成功しました。'
      redirect_to user_plant_basic_data_path(current_user)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @plant_basic_datum.update_attributes(plant_basic_datum_params)
      flash[:success] = "#{@plant_basic_datum.plant_name}の基本情報を更新しました。"
      redirect_to user_plant_basic_data_path(current_user)
    else
      render :edit
    end
  end

  def destroy
    @plant_basic_datum.destroy
    flash[:success] = "#{@plant_basic_datum.plant_name}のデータを削除しました。"
    redirect_to user_plant_basic_data_path(current_user)
  end

  private

    def plant_basic_datum_params
      params.require(:plant_basic_datum).permit(:user_id, :plant_name, :plant_breed_name, :plant_family_name, :plant_alias, :plant_scientific_name, :plant_place_of_origin, :characteristics_applications)
    end

end
