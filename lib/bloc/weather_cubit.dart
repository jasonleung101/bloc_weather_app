import 'package:bloc/bloc.dart';
import 'package:bloc_weather_app/model/weather.dart';
import 'package:bloc_weather_app/services/weather_service.dart';
import 'package:equatable/equatable.dart';

part 'weather_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  WeatherCubit() : super(WeatherInitial());

  Future<void> getWeather(String lat, String long) async {
    try {
      emit(WeatherLoading());
      final weather = await WeatherService.getWeather(lat, long);
      emit(WeatherLoaded(weather));
    } catch (e) {
      emit(WeatherError("Couldn't fetch weather. Is the device online?"));
    }
  }
}
