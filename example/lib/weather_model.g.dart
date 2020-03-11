// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WeatherResponse _$WeatherResponseFromJson(Map<String, dynamic> json) {
  return WeatherResponse(
    json['reason'] as String,
    json['error_code'] as int,
    json['result'] == null
        ? null
        : WeatherResult.fromJson(json['result'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$WeatherResponseToJson(WeatherResponse instance) =>
    <String, dynamic>{
      'reason': instance.reason,
      'error_code': instance.error_code,
      'result': instance.result.toJson(),
    };

WeatherResult _$WeatherResultFromJson(Map<String, dynamic> json) {
  return WeatherResult(
    json['city'] as String,
    json['realtime'] == null
        ? null
        : RealtimeWeather.fromJson(json['realtime'] as Map<String, dynamic>),
    (json['future'] as List)
        ?.map((e) => e == null
            ? null
            : FutureWeather.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$WeatherResultToJson(WeatherResult instance) =>
    <String, dynamic>{
      'city': instance.city,
      'realtime': instance.realtime.toJson(),
      'future': instance.future == null
          ? null
          : instance.future.map((FutureWeather weather) =>
              weather == null ? null : weather.toJson()),
    };

Wid _$WidFromJson(Map<String, dynamic> json) {
  return Wid(
    json['day'] as String,
    json['night'] as String,
  );
}

Map<String, dynamic> _$WidToJson(Wid instance) => <String, dynamic>{
      'day': instance.day,
      'night': instance.night,
    };

RealtimeWeather _$RealtimeWeatherFromJson(Map<String, dynamic> json) {
  return RealtimeWeather(
    json['temperature'] as String,
    json['humidity'] as String,
    json['info'] as String,
    json['wid'] as String,
    json['direct'] as String,
    json['power'] as String,
    json['aqi'] as String,
  );
}

Map<String, dynamic> _$RealtimeWeatherToJson(RealtimeWeather instance) =>
    <String, dynamic>{
      'temperature': instance.temperature,
      'humidity': instance.humidity,
      'info': instance.info,
      'wid': instance.wid,
      'direct': instance.direct,
      'power': instance.power,
      'aqi': instance.aqi,
    };

FutureWeather _$FutureWeatherFromJson(Map<String, dynamic> json) {
  return FutureWeather(
    json['date'] as String,
    json['temperature'] as String,
    json['weather'] as String,
    json['direct'] as String,
  )..wid = json['wid'] == null
      ? null
      : Wid.fromJson(json['wid'] as Map<String, dynamic>);
}

Map<String, dynamic> _$FutureWeatherToJson(FutureWeather instance) =>
    <String, dynamic>{
      'date': instance.date,
      'temperature': instance.temperature,
      'weather': instance.weather,
      'wid': instance.wid.toJson(),
      'direct': instance.direct,
    };
