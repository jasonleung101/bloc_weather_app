import 'package:bloc/bloc.dart';
import 'package:bloc_weather_app/bloc/country_list_cubit.dart';
import 'package:bloc_weather_app/bloc/weather_cubit.dart';
import 'package:bloc_weather_app/services/location_service.dart';
import 'package:equatable/equatable.dart';
import 'package:geolocator/geolocator.dart';

part 'location_state.dart';

class LocationCubit extends Cubit<LocationState> {
  final WeatherCubit weatherCubit;
  final CountryListCubit countryListCubit;

  LocationCubit(this.weatherCubit, this.countryListCubit)
      : super(LocationInitial());

  Future<void> getLocation() async {
    try {
      emit(LocationLoading());
      Position _position = await LocationService.determinePosition();
      print(_position.toString());
      emit(LocationLoaded(_position));
      await weatherCubit.getWeather(
          _position.latitude.toString(), _position.longitude.toString());
      countryListCubit
          .addCurrentLocationToList(weatherCubit.state.oneCallWeather);
    } catch (e) {
      print(e);
      emit(const LocationError('Failed to get location'));
    }
  }

  @override
  void onChange(Change<LocationState> change) {
    print(change.toString());
    super.onChange(change);
  }
}
