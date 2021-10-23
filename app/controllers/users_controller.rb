class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])

    @current_weather = current_user.current_weather.build(current_weather_params)

    #天気API
    #リクエストを出す
    open_weather = Api::OpenWeatherMap::Request.new(current_user.location_id)
    #戻り値を受け取る
    response = open_weather.request
    if @current_weather.valid?
      #APIが正常に動作した場合
      if response['cod'] == 200
        params_weather = Api::OpenWeatherMap::Request.attributes_for(response)
        @current_weather.update(params_weather)
        flash[:notice] = "登録に成功しました"
      else
        #APIが正常に動作しない場合も料理情報は記録する
        flash[:notice] = "天気情報の取得に失敗しました。ページを更新してください"
      end
      redirect_to root_url
    else
      render 'new'
    end
  end
end
