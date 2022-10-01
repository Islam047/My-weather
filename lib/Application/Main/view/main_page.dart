import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:my_weather/Application/AirQuality/view/air_quality_screen.dart';
import 'package:my_weather/Application/Elevation/view/elevation_screen.dart';
import 'package:my_weather/Application/Home/view/home_screen.dart';
import 'package:my_weather/Application/Internet/bloc/internet_bloc.dart';
import 'package:my_weather/Application/Main/bloc/main_bloc.dart';

import '../../../Data/NotificationProvider/notification_provider.dart';

class MainPage extends StatelessWidget {
  MainPage({Key? key, required this.index}) : super(key: key);
  final int index;

  final List<Widget> pages = [
    const AirQualityScreen(),
    HomeScreen(),
    ElevationScreen(),
  ];

  @override
  Widget build(BuildContext context) {

    return BlocListener<InternetBloc, InternetState>(
      listener: (context, state) {
        if(state is InternetConnectedState){
          showSimpleNotification(
            const Text("Connected"),
            autoDismiss: true,
            background: Colors.black,
          );
        }
        else if(state is InternetDisconnectedState){
          showSimpleNotification(
            const Text("Please Connect your Internet to get data"),
            autoDismiss: true,
            background: Colors.black,
          );
        }
      },
      child: BlocProvider(
        create: (context) => MainBloc(),
        child: BlocBuilder<MainBloc, MainState>(

          builder: (context, state) {
            final provider = context.read<MainBloc>();

            return Scaffold(
              backgroundColor: const Color(0xff2E335A).withOpacity(1),
              body: pages[provider.state.index],
              bottomNavigationBar: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Container(
                    height: 100,
                    color: const Color(0xff48319D),
                    child: const Image(
                        width: double.infinity,
                        fit: BoxFit.cover,
                        image: AssetImage(
                          "assets/images/bottom_back.png",
                        ),),
                  ),
                  const Image(
                      fit: BoxFit.cover,
                      image: AssetImage(
                        "assets/images/bottom_center.png",
                      )),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                          padding: const EdgeInsets.only(left: 40, bottom: 30),
                          onPressed: () {
                            provider.add(MainChangePageEvent(0, context));
                          },
                          icon: const Icon(
                            Icons.location_on_outlined,
                            color: Colors.white,
                            size: 40,
                          )),
                      IconButton(
                        padding: const EdgeInsets.only(right: 40, bottom: 30),
                        onPressed: () {
                          provider.add(MainChangePageEvent(2, context));
                        },
                        icon: const Icon(
                          Icons.show_chart,
                          color: Colors.white,
                          size: 40,
                        ),
                      ),
                    ],
                  ),
                  Positioned(
                    bottom: 30,
                    child: IconButton(
                      onPressed: () {
                        provider.add(MainChangePageEvent(1, context));
                      },
                      icon: const Icon(
                        Icons.add,
                        size: 30,
                      ),
                    ),
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
