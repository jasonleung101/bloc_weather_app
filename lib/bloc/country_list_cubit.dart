import 'package:bloc_weather_app/model/weather.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

class CountryListCubit extends HydratedCubit<List<WeatherResponse>> {
  CountryListCubit() : super(const []);

  @override
  List<WeatherResponse>? fromJson(Map<String, dynamic> json) =>
      json['country_list'];

  @override
  Map<String, dynamic>? toJson(List<WeatherResponse> state) =>
      {'country_list': state};

  void addCurrentLocationToList(WeatherResponse response) {
    List<WeatherResponse> _data = state.toList();
    _data.add(response);
    emit(_data);
  }

  @override
  void onChange(Change<List<WeatherResponse>> change) {
    print(change.toString());
    super.onChange(change);
  }
}
