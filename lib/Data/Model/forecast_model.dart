import 'dart:convert';
ForecastModel forecastModelFromJson(String str) => ForecastModel.fromJson(json.decode(str));
String forecastModelToJson(ForecastModel data) => json.encode(data.toJson());
class ForecastModel {
  ForecastModel({
    this.location,
    this.current,
    this.forecast,});

  ForecastModel.fromJson(dynamic json) {
    location = json['location'] != null ? Location.fromJson(json['location']) : null;
    current = json['current'] != null ? Current.fromJson(json['current']) : null;
    forecast = json['forecast'] != null ? Forecast.fromJson(json['forecast']) : null;
  }
  Location? location;
  Current? current;
  Forecast? forecast;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (location != null) {
      map['location'] = location?.toJson();
    }
    if (current != null) {
      map['current'] = current?.toJson();
    }
    if (forecast != null) {
      map['forecast'] = forecast?.toJson();
    }
    return map;
  }

}

Forecast forecastFromJson(String str) => Forecast.fromJson(json.decode(str));
String forecastToJson(Forecast data) => json.encode(data.toJson());
class Forecast {
  Forecast({
    this.forecastday,});

  Forecast.fromJson(dynamic json) {
    if (json['forecastday'] != null) {
      forecastday = [];
      json['forecastday'].forEach((v) {
        forecastday?.add(Forecastday.fromJson(v));
      });
    }
  }
  List<Forecastday>? forecastday;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (forecastday != null) {
      map['forecastday'] = forecastday?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

Forecastday forecastdayFromJson(String str) => Forecastday.fromJson(json.decode(str));
String forecastdayToJson(Forecastday data) => json.encode(data.toJson());
class Forecastday {
  Forecastday({
    this.date,
    this.day,
    this.astro,
    this.hour,});

  Forecastday.fromJson(dynamic json) {
    date = json['date'];
    day = json['day'] != null ? Day.fromJson(json['day']) : null;
    astro = json['astro'] != null ? Astro.fromJson(json['astro']) : null;
    if (json['hour'] != null) {
      hour = [];
      json['hour'].forEach((v) {
        hour?.add(Hour.fromJson(v));
      });
    }
  }
  String? date;
  Day? day;
  Astro? astro;
  List<Hour>? hour;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['date'] = date;
    if (day != null) {
      map['day'] = day?.toJson();
    }
    if (astro != null) {
      map['astro'] = astro?.toJson();
    }
    if (hour != null) {
      map['hour'] = hour?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

Hour hourFromJson(String str) => Hour.fromJson(json.decode(str));
String hourToJson(Hour data) => json.encode(data.toJson());
class Hour {
  Hour({
    this.time,
    this.tempC,
    this.condition,
    this.windKph,
    this.windDir,
    this.humidity,
    this.cloud,
    this.feelslikeC,
    this.chanceOfRain,
    this.chanceOfSnow,});

  Hour.fromJson(dynamic json) {
    time = json['time'];
    tempC = json['temp_c'];
    condition = json['condition'] != null ? Condition.fromJson(json['condition']) : null;
    windKph = json['wind_kph'];
    windDir = json['wind_dir'];
    humidity = json['humidity'];
    cloud = json['cloud'];
    feelslikeC = json['feelslike_c'];
    chanceOfRain = json['chance_of_rain'];
    chanceOfSnow = json['chance_of_snow'];
  }
  String? time;
  num? tempC;
  Condition? condition;
  num? windKph;
  String? windDir;
  num? humidity;
  num? cloud;
  num? feelslikeC;
  num? chanceOfRain;
  num? chanceOfSnow;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['time'] = time;
    map['temp_c'] = tempC;
    if (condition != null) {
      map['condition'] = condition?.toJson();
    }
    map['wind_kph'] = windKph;
    map['wind_dir'] = windDir;
    map['humidity'] = humidity;
    map['cloud'] = cloud;
    map['feelslike_c'] = feelslikeC;
    map['chance_of_rain'] = chanceOfRain;
    map['chance_of_snow'] = chanceOfSnow;
    return map;
  }

}

Condition conditionFromJson(String str) => Condition.fromJson(json.decode(str));
String conditionToJson(Condition data) => json.encode(data.toJson());
class Condition {
  Condition({
    this.text,
    this.icon,
    this.code,});

  Condition.fromJson(dynamic json) {
    text = json['text'];
    icon = json['icon'];
    code = json['code'];
  }
  String? text;
  String? icon;
  num? code;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['text'] = text;
    map['icon'] = icon;
    map['code'] = code;
    return map;
  }

}

Astro astroFromJson(String str) => Astro.fromJson(json.decode(str));
String astroToJson(Astro data) => json.encode(data.toJson());
class Astro {
  Astro({
    this.sunrise,
    this.sunset,});

  Astro.fromJson(dynamic json) {
    sunrise = json['sunrise'];
    sunset = json['sunset'];
  }
  String? sunrise;
  String? sunset;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['sunrise'] = sunrise;
    map['sunset'] = sunset;
    return map;
  }

}

Day dayFromJson(String str) => Day.fromJson(json.decode(str));
String dayToJson(Day data) => json.encode(data.toJson());
class Day {
  Day({
    this.maxtempC,
    this.mintempC,
    this.avgtempC,
    this.dailyChanceOfRain,
    this.dailyChanceOfSnow,
    this.condition,});

  Day.fromJson(dynamic json) {
    maxtempC = json['maxtemp_c'];
    mintempC = json['mintemp_c'];
    avgtempC = json['avgtemp_c'];
    dailyChanceOfRain = json['daily_chance_of_rain'];
    dailyChanceOfSnow = json['daily_chance_of_snow'];
    condition = json['condition'] != null ? Condition.fromJson(json['condition']) : null;
  }
  num? maxtempC;
  num? mintempC;
  num? avgtempC;
  num? dailyChanceOfRain;
  num? dailyChanceOfSnow;
  Condition? condition;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['maxtemp_c'] = maxtempC;
    map['mintemp_c'] = mintempC;
    map['avgtemp_c'] = avgtempC;
    map['daily_chance_of_rain'] = dailyChanceOfRain;
    map['daily_chance_of_snow'] = dailyChanceOfSnow;
    if (condition != null) {
      map['condition'] = condition?.toJson();
    }
    return map;
  }

}


Current currentFromJson(String str) => Current.fromJson(json.decode(str));
String currentToJson(Current data) => json.encode(data.toJson());
class Current {
  Current({
    this.tempC,
    this.isDay,
    this.condition,
    this.windKph,
    this.windDir,
    this.humidity,
    this.cloud,
    this.uv,});

  Current.fromJson(dynamic json) {
    tempC = json['temp_c'];
    isDay = json['is_day'];
    condition = json['condition'] != null ? Condition.fromJson(json['condition']) : null;
    windKph = json['wind_kph'];
    windDir = json['wind_dir'];
    humidity = json['humidity'];
    cloud = json['cloud'];
    uv = json['uv'];
  }
  num? tempC;
  num? isDay;
  Condition? condition;
  num? windKph;
  String? windDir;
  num? humidity;
  num? cloud;
  num? uv;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['temp_c'] = tempC;
    map['is_day'] = isDay;
    if (condition != null) {
      map['condition'] = condition?.toJson();
    }
    map['wind_kph'] = windKph;
    map['wind_dir'] = windDir;
    map['humidity'] = humidity;
    map['cloud'] = cloud;
    map['uv'] = uv;
    return map;
  }

}



Location locationFromJson(String str) => Location.fromJson(json.decode(str));
String locationToJson(Location data) => json.encode(data.toJson());
class Location {
  Location({
    this.name,
    this.region,
    this.country,
    this.lat,
    this.lon,
    this.tzId,
    this.localtimeEpoch,
    this.localtime,});

  Location.fromJson(dynamic json) {
    name = json['name'];
    region = json['region'];
    country = json['country'];
    lat = json['lat'];
    lon = json['lon'];
    tzId = json['tz_id'];
    localtimeEpoch = json['localtime_epoch'];
    localtime = json['localtime'];
  }
  String? name;
  String? region;
  String? country;
  num? lat;
  num? lon;
  String? tzId;
  num? localtimeEpoch;
  String? localtime;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['region'] = region;
    map['country'] = country;
    map['lat'] = lat;
    map['lon'] = lon;
    map['tz_id'] = tzId;
    map['localtime_epoch'] = localtimeEpoch;
    map['localtime'] = localtime;
    return map;
  }

}