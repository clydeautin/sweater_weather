class WeatherApiFacade
  def get_weather_now(location)
    json = WeatherApiService.get_current_weather(location)
    WeatherCurrent.new(json)
  end

  def get_weather_forecast(location)
    json = WeatherApiService.get_forecast_5(location)

    json[:forecast][:forecastday].map do |daily_weather|
      WeatherForecast.new(daily_weather)
    end
  end

  def get_weather_hourly(location)
    json = WeatherApiService.get_forecast_5(location)

    json[:forecast][:forecastday][0][:hour].map do |hourly_weather|
      WeatherHourly.new(hourly_weather)
    end
  end

  def get_weather_package(today, forecast, hourly)
    Weather.new(today, forecast, hourly)
  end
end