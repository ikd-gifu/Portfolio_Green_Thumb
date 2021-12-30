module Api
  module OpenWeatherMap
    class Request
      attr_accessor :query

      def initialize(location_id)
        @query = {
          id: location_id,
          units: 'metric',
          lang: 'ja',
          appid: ENV['OPEN_WEATHER_MAP_API']
        }
      end

      def request
        client = HTTPClient.new
        # request = client.get(ENV['URI'], query)
        request = client.get('https://api.openweathermap.org/data/2.5/weather', query)
        JSON.parse(request.body)
      end

      # 取得したjsonをparamsに変換
      def self.attributes_for(attrs)
        {
          weather_main: attrs['weather'][0]['main'],
          weather_description: attrs['weather'][0]['description'],
          weather_icon: attrs['weather'][0]['icon'],
          weather_id: attrs['weather'][0]['id'],
          temp: attrs['main']['temp'],
          temp_max: attrs['main']['temp_max'],
          temp_min: attrs['main']['temp_min'],
          humidity: attrs['main']['humidity'],
          pressure: attrs['main']['pressure']
        }
      end
    end
  end
end
