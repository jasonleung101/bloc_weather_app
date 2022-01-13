import 'package:json_annotation/json_annotation.dart';

part 'one_call_weather.g.dart';

@JsonSerializable()
class OneCallWeather {
  double? lat;
  double? lon;
  String? timezone;
  @JsonKey(name: 'timezone_offset')
  int? timezoneOffset;
  Current? current;
  List<Hourly>? hourly;
  List<Daily>? daily;

  OneCallWeather(
      {this.lat,
      this.lon,
      this.timezone,
      this.timezoneOffset,
      this.current,
      this.hourly,
      this.daily});

  factory OneCallWeather.fromJson(Map<String, dynamic> json) =>
      _$OneCallWeatherFromJson(json);

  Map<String, dynamic> toJson() => _$OneCallWeatherToJson(this);
}

@JsonSerializable()
class Current {
  int? dt;
  int? sunrise;
  int? sunset;
  double? temp;
  @JsonKey(name: "feels_like")
  double? feelsLike;
  int? pressure;
  int? humidity;
  @JsonKey(name: "dew_point")
  double? dewPoint;
  double? uvi;
  int? clouds;
  int? visibility;
  @JsonKey(name: "wind_speed")
  double? windSpeed;
  @JsonKey(name: "wind_deg")
  int? windDeg;
  @JsonKey(name: "wind_gust")
  double? windGust;
  List<Weather>? weather;

  Current(
      {this.dt,
      this.sunrise,
      this.sunset,
      this.temp,
      this.feelsLike,
      this.pressure,
      this.humidity,
      this.dewPoint,
      this.uvi,
      this.clouds,
      this.visibility,
      this.windSpeed,
      this.windDeg,
      this.windGust,
      this.weather});

  factory Current.fromJson(Map<String, dynamic> json) =>
      _$CurrentFromJson(json);

  Map<String, dynamic> toJson() => _$CurrentToJson(this);
}

@JsonSerializable()
class Weather {
  int? id;
  String? main;
  String? description;
  String? icon;

  Weather({this.id, this.main, this.description, this.icon});

  factory Weather.fromJson(Map<String, dynamic> json) =>
      _$WeatherFromJson(json);

  Map<String, dynamic> toJson() => _$WeatherToJson(this);
}

@JsonSerializable()
class Hourly {
  int? dt;
  double? temp;
  @JsonKey(name: "feels_like")
  double? feelsLike;
  int? pressure;
  int? humidity;
  @JsonKey(name: "dew_point")
  double? dewPoint;
  double? uvi;
  int? clouds;
  int? visibility;
  @JsonKey(name: "wind_speed")
  double? windSpeed;
  @JsonKey(name: "wind_deg")
  int? windDeg;
  @JsonKey(name: "wind_gust")
  double? windGust;
  List<Weather>? weather;
  int? pop;

  Hourly(
      {this.dt,
      this.temp,
      this.feelsLike,
      this.pressure,
      this.humidity,
      this.dewPoint,
      this.uvi,
      this.clouds,
      this.visibility,
      this.windSpeed,
      this.windDeg,
      this.windGust,
      this.weather,
      this.pop});

  factory Hourly.fromJson(Map<String, dynamic> json) => _$HourlyFromJson(json);

  Map<String, dynamic> toJson() => _$HourlyToJson(this);
}

@JsonSerializable()
class Daily {
  int? dt;
  int? sunrise;
  int? sunset;
  int? moonrise;
  int? moonset;
  @JsonKey(name: "moon_phase")
  double? moonPhase;
  Temp? temp;
  @JsonKey(name: "feels_like")
  FeelsLike? feelsLike;
  int? pressure;
  int? humidity;
  @JsonKey(name: "dew_point")
  double? dewPoint;
  @JsonKey(name: "wind_speed")
  double? windSpeed;
  @JsonKey(name: "wind_deg")
  int? windDeg;
  @JsonKey(name: "wind_gust")
  double? windGust;
  List<Weather>? weather;
  int? clouds;
  double? pop;
  double? uvi;
  double? snow;
  double? rain;

  Daily(
      {this.dt,
      this.sunrise,
      this.sunset,
      this.moonrise,
      this.moonset,
      this.moonPhase,
      this.temp,
      this.feelsLike,
      this.pressure,
      this.humidity,
      this.dewPoint,
      this.windSpeed,
      this.windDeg,
      this.windGust,
      this.weather,
      this.clouds,
      this.pop,
      this.uvi,
      this.snow,
      this.rain});

  factory Daily.fromJson(Map<String, dynamic> json) => _$DailyFromJson(json);

  Map<String, dynamic> toJson() => _$DailyToJson(this);
}

@JsonSerializable()
class Temp {
  double? day;
  double? min;
  double? max;
  double? night;
  double? eve;
  double? morn;

  Temp({this.day, this.min, this.max, this.night, this.eve, this.morn});

  factory Temp.fromJson(Map<String, dynamic> json) => _$TempFromJson(json);

  Map<String, dynamic> toJson() => _$TempToJson(this);
}

@JsonSerializable()
class FeelsLike {
  double? day;
  double? night;
  double? eve;
  double? morn;

  FeelsLike({this.day, this.night, this.eve, this.morn});

  factory FeelsLike.fromJson(Map<String, dynamic> json) =>
      _$FeelsLikeFromJson(json);

  Map<String, dynamic> toJson() => _$FeelsLikeToJson(this);
}
