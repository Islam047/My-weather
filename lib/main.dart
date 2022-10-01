import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:my_weather/Data/StorageProvider/storage.dart';
import 'package:my_weather/app.dart';

//
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox(HiveService.dbName);
  final storage = await HydratedStorage.build(
      storageDirectory: await getApplicationDocumentsDirectory());
  HydratedBlocOverrides.runZoned(
      () => SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then((value) {
            runApp(MyApp(connectivity: Connectivity()));
          }),
      storage: storage);
}
