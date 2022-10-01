import 'package:dio/dio.dart';

import 'interceptor_provider.dart';

class NetworkProvider {
  NetworkProvider._();

  static final instance = NetworkProvider._();
  /// Base Url */
static   String SERVER_PRODUCTION = "https://api.weatherapi.com/v1";
   String key = '831d6df8838640fc85635912223009';

  static String get baseApiUrl {
    return SERVER_PRODUCTION;
  }

  /// Apis */
   String API_CURRENT = "/current.json";
   String API_FORECAST = "/forecast.json";
   String API_SEARCH = "/search.json"; // {ID}
   String API_ASTRONOMY = "/astronomy.json"; // {ID}
  /// Headers */
  static Map<String, String> get headers {
    Map<String, String> headers = {
      'Accept': '*/*',
      'Content-Type': 'application/json',
      'Accept-Version': 'v1',
    };
    return headers;
  }

  /// BaseOptions */
  static final BaseOptions _baseDioOptions = BaseOptions(
    baseUrl: baseApiUrl,
    headers: headers,
    connectTimeout: 40000,
    receiveTimeout: 40000,
    contentType: 'application/json',
    responseType: ResponseType.json,
  );

 static  final Dio _dio = Dio(_baseDioOptions)
    ..interceptors.add(DioInterceptor());

  /* Dio Requests */
   Future GET(String api, Map<String, dynamic> params) async {
    Response response = await _dio.get(api, queryParameters: params);
    if (response.statusCode == 200 || response.statusCode == 201) {
      return response.data;
    }
    return null;
  }

  /* Parameters */
   Map<String, dynamic> paramsCurrentWeather(
          {String city = 'Toshkent'}) =>
      {'key': key, 'q': city, 'aqi': 'yes'};

   Map<String, dynamic> paramsAstronomy({String city = 'Toshkent'}) {
    String data = DateTime.now().toString().substring(0, 10);
    return {'key': key, 'q': city, 'dt': data};
  }

   Map<String, dynamic> paramsForecast({ required String city}) {
    return {
      'key': key,
      'q': city,
      'days':'3',
      'aqi': 'no',
      'alerts':'no'
    };
  }
}
