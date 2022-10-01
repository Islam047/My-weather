import 'dart:convert';

import 'location_model.dart';
AstronomyModel astronomyModelFromJson(String str) => AstronomyModel.fromJson(json.decode(str));
String astronomyModelToJson(AstronomyModel data) => json.encode(data.toJson());
class AstronomyModel {
  AstronomyModel({
    this.location,
    this.astronomy,});

  AstronomyModel.fromJson(dynamic json) {
    location = json['location'] != null ? Location.fromJson(json['location']) : null;
    astronomy = json['astronomy'] != null ? Astronomy.fromJson(json['astronomy']) : null;
  }
  Location? location;
  Astronomy? astronomy;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (location != null) {
      map['location'] = location?.toJson();
    }
    if (astronomy != null) {
      map['astronomy'] = astronomy?.toJson();
    }
    return map;
  }

}

Astronomy astronomyFromJson(String str) => Astronomy.fromJson(json.decode(str));
String astronomyToJson(Astronomy data) => json.encode(data.toJson());
class Astronomy {
  Astronomy({
    this.astro,});

  Astronomy.fromJson(dynamic json) {
    astro = json['astro'] != null ? Astro.fromJson(json['astro']) : null;
  }
  Astro? astro;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (astro != null) {
      map['astro'] = astro?.toJson();
    }
    return map;
  }

}

Astro astroFromJson(String str) => Astro.fromJson(json.decode(str));
String astroToJson(Astro data) => json.encode(data.toJson());
class Astro {
  Astro({
    this.sunrise,
    this.sunset,
    this.moonrise,
    this.moonset,
    this.moonPhase,
    this.moonIllumination,});

  Astro.fromJson(dynamic json) {
    sunrise = json['sunrise'];
    sunset = json['sunset'];
    moonrise = json['moonrise'];
    moonset = json['moonset'];
    moonPhase = json['moon_phase'];
    moonIllumination = json['moon_illumination'];
  }
  String? sunrise;
  String? sunset;
  String? moonrise;
  String? moonset;
  String? moonPhase;
  String? moonIllumination;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['sunrise'] = sunrise;
    map['sunset'] = sunset;
    map['moonrise'] = moonrise;
    map['moonset'] = moonset;
    map['moon_phase'] = moonPhase;
    map['moon_illumination'] = moonIllumination;
    return map;
  }

}
