import 'package:json_annotation/json_annotation.dart';

part 'weather_model.g.dart';


@JsonSerializable()
class WeatherResponse {
  String reason;
  int error_code;
  WeatherResult result;

  WeatherResponse(this.reason,this.error_code,this.result);
  factory WeatherResponse.fromJson(Map<String, dynamic> json) => _$WeatherResponseFromJson(json);

  Map<String, dynamic> toJson() => _$WeatherResponseToJson(this);

}

@JsonSerializable()
class WeatherResult{

  String city;
  RealtimeWeather realtime;
  List<FutureWeather> future;

  WeatherResult(this.city,this.realtime,this.future);

  factory WeatherResult.fromJson(Map<String, dynamic> json) => _$WeatherResultFromJson(json);
  Map<String, dynamic> toJson() => _$WeatherResultToJson(this);
}

@JsonSerializable()
class Wid{
  String day;
  String night;
  Wid(this.day,this.night);

  factory Wid.fromJson(Map<String, dynamic> json) => _$WidFromJson(json);
  Map<String, dynamic> toJson() => _$WidToJson(this);

}
@JsonSerializable()
class RealtimeWeather{

  String temperature;
  String humidity;
  String info;
  String wid;
  String direct;
  String power;
  String aqi;

  RealtimeWeather(this.temperature,this.humidity,this.info,this.wid,this.direct,this.power,this.aqi);

  factory RealtimeWeather.fromJson(Map<String, dynamic> json) => _$RealtimeWeatherFromJson(json);
  Map<String, dynamic> toJson() => _$RealtimeWeatherToJson(this);
}
@JsonSerializable()
class FutureWeather{

  String date;
  String temperature;
  String weather;
  Wid wid;
  String direct;

  FutureWeather(this.date,this.temperature,this.weather,this.direct);

  factory FutureWeather.fromJson(Map<String, dynamic> json) => _$FutureWeatherFromJson(json);
  Map<String, dynamic> toJson() => _$FutureWeatherToJson(this);

}