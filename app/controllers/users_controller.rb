class UsersController < ApplicationController
  before_action :authenticate_user! , only: [:index, :show, :new, :create, :edit, :update, :destroy]

  def show
    @user = User.find(params[:id])

    @city = City.find_by(location_id: @user.location_id)
    @current_weather = CurrentWeather.new(city_id: @city.id)

    #天気API
    #リクエストを出す
    open_weather = Api::OpenWeatherMap::Request.new(@user.location_id)
    #戻り値を受け取る
    response = open_weather.request
    if @current_weather.valid?
      #APIが正常に動作した場合
      if response['cod'] == 200
        params_weather = Api::OpenWeatherMap::Request.attributes_for(response)
        @current_weather.update(params_weather)
        #flash[:notice] = "登録に成功しました"
      else
        #APIが正常に動作しない場合も料理情報は記録する
        @current_weather.update(weather_main: "FALSE")
        flash[:notice] = "天気情報の取得に失敗しました。ページを更新してください"
      end
      #redirect_to root_url
    else
      render 'new'
    end
  end
end
