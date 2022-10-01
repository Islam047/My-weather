import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:my_weather/Application/Home/bloc/home_bloc.dart';
import 'package:my_weather/Application/Internet/bloc/internet_bloc.dart';
import 'package:my_weather/Application/Splash/view/splash_screen.dart';
import 'package:my_weather/Data/StorageProvider/storage.dart';
import 'Application/AgreeToTerms/view/get_userlocation.dart';

class MyApp extends StatelessWidget {
  final Connectivity connectivity;
  const MyApp({
    Key? key, required this.connectivity,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) {
            return InternetBloc();
          },
        ),
        BlocProvider(
          create: (context) {
            return HomeBloc()..add(HomeGetWeatherData());
          },
        ),

      ],
      child: OverlaySupport.global(
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Weather Application',
          theme: ThemeData().copyWith(
            colorScheme: ThemeData().colorScheme.copyWith(
                  primary: Colors.white,
                ),
          ),
          home: HiveService.readData(StorageKey.userLocation) != null
              ? const SplashScreen()
              :  const GetUserLocation(),
        ),
      ),
    );
  }
}
