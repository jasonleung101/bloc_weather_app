import 'package:bloc_weather_app/model/one_call_weather.dart';
import 'package:bloc_weather_app/model/weather.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

class CountryListCubit extends HydratedCubit<List<OneCallWeather>> {
  CountryListCubit() : super(const []);

  @override
  List<OneCallWeather>? fromJson(Map<String, dynamic> json) =>
      json['country_list'];

  @override
  Map<String, dynamic>? toJson(List<OneCallWeather> state) =>
      {'country_list': state};

  void addCurrentLocationToList(OneCallWeather response) {
    List<OneCallWeather> _data = state.toList();
    _data.add(response);
    emit(_data);
  }

  @override
  void onChange(Change<List<OneCallWeather>> change) {
    print(change.toString());
    super.onChange(change);
  }
}
