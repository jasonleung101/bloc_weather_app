part of 'weather_cubit.dart';

abstract class WeatherState extends Equatable {
  final WeatherResponse weatherResponse;
  final String error;

  const WeatherState(this.weatherResponse, this.error);

  @override
  List<Object> get props => [weatherResponse];
}

class WeatherInitial extends WeatherState {
  WeatherInitial() : super(WeatherResponse(), '');
}

class WeatherLoading extends WeatherState {
  WeatherLoading() : super(WeatherResponse(), '');
}

class WeatherLoaded extends WeatherState {
  const WeatherLoaded(WeatherResponse weatherResponse) : super(weatherResponse, '');
}

class WeatherError extends WeatherState {
  WeatherError(String error) : super(WeatherResponse(), error);
}
