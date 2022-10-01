import 'dart:convert';

import 'package:my_weather/Data/DataProvider/network_provider.dart';
import 'package:my_weather/Data/Model/forecast_model.dart';
import 'package:my_weather/Data/StorageProvider/storage.dart';

class HomeRepository {
  late NetworkProvider network;
  static final instance = HomeRepository._();

  HomeRepository._() {
    network = NetworkProvider.instance;
  }

  Future<ForecastModel?> getAllData() async {
    String city = HiveService.readData(StorageKey.userLocation);
    Map map = await network.GET(network.API_FORECAST, network.paramsForecast(city: city));
    if(map.isEmpty){
      return null;
    }
    ForecastModel currentModel = forecastModelFromJson(jsonEncode(map));
    return currentModel;
  }
}
