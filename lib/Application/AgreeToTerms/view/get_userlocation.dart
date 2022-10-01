import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:my_weather/Application/AgreeToTerms/bloc/location_bloc.dart';
import 'package:my_weather/Constants/constants_textstyle.dart';
import 'package:my_weather/Data/StorageProvider/storage.dart';
import '../../../Utilities/utils.dart';
import '../../Splash/view/splash_screen.dart';

class GetUserLocation extends HookWidget {
  const GetUserLocation({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Color> colorList = [
      const Color(0xff171B70),
      const Color(0xff410D75),
      const Color(0xff032340),
      const Color(0xff050340),
      const Color(0xff2C0340),
    ];

    ValueNotifier<int> index = useState(0);
    ValueNotifier<Color> bottomColor = useState(const Color(0xff092646));
    ValueNotifier<Color> topColor = useState(const Color(0xff410D75));
    const Alignment begin = Alignment.bottomCenter;
    const Alignment end = Alignment.topCenter;
    Timer(
      const Duration(microseconds: 0),
          () {
        bottomColor.value = const Color(0xff33267C);
      },
    );
    return Scaffold(
      body: AnimatedContainer(
        height: double.infinity,
        width: double.infinity,
        duration: const Duration(seconds: 2),
        onEnd: () {
          index.value = index.value + 1;
          bottomColor.value = colorList[index.value % colorList.length];
          topColor.value = colorList[(index.value + 1) % colorList.length];
        },
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: begin,
            end: end,
            colors: [bottomColor.value, topColor.value],
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              flex: 1,
              child: Container(),
            ),
            Expanded(
              flex: 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    "Weather Application",
                    style: Style.styleTen,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Column(
                    children: [
                      Text(
                        "To continue, please do agree to get your current location",
                        style: Style.styleSeven,
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      BlocProvider(
                        create: (context) => LocationBloc(),
                        child: BlocBuilder<LocationBloc, LocationState>(
                          builder: (context, state) {
                            var provider = context.read<LocationBloc>();
                            return MaterialButton(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              height: 50,
                              minWidth: 100,
                              color: Colors.black,
                              onPressed: () {

                                if(HiveService.readData(StorageKey.userLocation) == null){
                                  provider.add(GetUserLocationEvent());
                                }
                                if(HiveService.readData(StorageKey.userLocation) != null){
                                  Navigator.push(context, SlideTransitionAnimation(
                                      const SplashScreen(),
                                      TextDirection.rtl
                                  ));
                                }
                              },
                              child: Text(HiveService.readData(StorageKey.userLocation) != null ?
                                "Get started" : "Agree to terms",
                                style: Style.styleSeven,
                              ),
                            );
                          },
                        ),
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
