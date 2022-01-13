part of 'weather_cubit.dart';

abstract class WeatherState extends Equatable {
  final OneCallWeather oneCallWeather;
  final String error;

  const WeatherState(this.oneCallWeather, this.error);

  @override
  List<Object> get props => [oneCallWeather];
}

class WeatherInitial extends WeatherState {
  WeatherInitial() : super(OneCallWeather(), '');
}

class WeatherLoading extends WeatherState {
  WeatherLoading() : super(OneCallWeather(), '');
}

class WeatherLoaded extends WeatherState {
  const WeatherLoaded(OneCallWeather oneCallWeather)
      : super(oneCallWeather, '');
}

class WeatherError extends WeatherState {
  WeatherError(String error) : super(OneCallWeather(), error);
}
