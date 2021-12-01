class GardeningDiariesController < ApplicationController

  def index
    @user = User.find(params[:user_id])
    @city = City.find_by(location_id: @user.location_id)
    @current_weather = CurrentWeather.where(city_id: @city.id).order(updated_at: :DESC).limit(1).take
    @gardening_diaries = GardeningDiary.all.order(implementation_date: :DESC).limit(3)
  end

  def show
    @gardening_diary = GardeningDiary.find(params[:id])
  end

  def new
    @gardening_diary = GardeningDiary.new(user_id: params[:user_id])
  end

  def create
    @gardening_diary = GardeningDiary.new(material_stock_table_params)
    if @gardening_diary.save
      redirect_to user_gardening_diaries_path, notice: "園芸日誌の作成に成功しました。"
    else
      redirect_to new_user_gardening_diary_path(current_user), alert: "園芸日誌を作成できませんでした。"
    end
  end

  def edit
    @gardening_diary = GardeningDiary.find(params[:id])
  end

  def update
    @gardening_diary = GardeningDiary.find(params[:id])
    if @gardening_diary.update(gardening_diary_params)
      redirect_to user_gardening_diaries_path(current_user), notice: "#{@gardening_diary.work_name}を更新しました。"
    else
      redirect_to user_gardening_diaries_path(current_user), alert: "園芸日誌の更新に失敗しました。"
    end
  end

  def destroy
    @gardening_diary = GardeningDiary.find(params[:id])
    @gardening_diary.destroy
    redirect_to user_gardening_diaries_path(current_user), notice: "#{@gardening_diary.work_name}のデータを削除しました。"
  end

  private

    def gardening_diary_params
      params.require(:gardening_diary).permit(:user_id, :work_name, :implementation_date, :work_content, :plant_name, :plant_basic_datum_id, :plant_individual_name, :material_name, :material_consumption)
    end
end
