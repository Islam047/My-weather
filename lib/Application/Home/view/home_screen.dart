import 'dart:math';
import 'package:animated_background/animated_background.dart';
import 'package:day_night_switcher/day_night_switcher.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_weather/Application/Home/bloc/home_bloc.dart';
import 'package:my_weather/Application/Home/view/home_animation.dart';
import 'package:my_weather/Constants/constants_textstyle.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:my_weather/Utilities/LogProvider/log_provider.dart';
import 'home_widgets.dart';

class HomeScreen extends HookWidget {
  HomeScreen({Key? key}) : super(key: key);
  bool isTapped = false;

  @override
  Widget build(BuildContext context) {
    TabController tabController = useTabController(initialLength: 2);
    AnimationController arrowAnimationController = useAnimationController(
      duration: const Duration(milliseconds: 300),
    );
    Animation arrowAnimation =
        Tween(begin: 0.0, end: pi).animate(arrowAnimationController);
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    var provider = context.read<HomeBloc>();
    return Scaffold(
      body: BlocBuilder<HomeBloc, HomeState>(
        bloc: provider,
        builder: (context, state) {
          return Stack(
            children: [
              Background(
                behaviour: state.behaviour!
                    ? ChildFlySpaceBehaviour()
                    : BubblesBehaviour(),
                child: SizedBox(
                  height: height,
                  width: width,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 40, top: 45),
                            child: DayNightSwitcher(
                              isDarkModeEnabled: state.behaviour!,
                              onStateChanged: (isDarkModeEnabled) {
                                if (state.behaviour == true) {
                                  provider.add(HomeChangeBackEvent(false));
                                } else {
                                  provider.add(HomeChangeBackEvent(true));
                                }
                              },
                            ),
                          )
                        ],
                      ),
                      Text(
                        "${state.forecastModel?.location?.name ?? ' '}  ",
                        style: Style.styleOne,
                      ),
                      Text(
                        "${state.forecastModel?.current?.tempC ?? 0} °",
                        style: Style.styleTwo,
                      ),
                      Text(
                        "${state.forecastModel?.current?.condition?.text ?? " "} °",
                        style: Style.styleThree,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      RichText(
                        text: TextSpan(
                          style: Style.styleFour,
                          children: [
                            TextSpan(
                                text:
                                    "Humidity: ${state.forecastModel?.current?.tempC ?? 0}° "),
                            TextSpan(
                                text:
                                    "Cloud:  ${state.forecastModel?.current?.cloud ?? 0}° "),
                          ],
                        ),
                      ),
                      Image(
                          fit: BoxFit.cover,
                          height: height / 2.12,
                          width: double.infinity,
                          image: const AssetImage('assets/images/house.png')),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
      floatingActionButton: InkWell(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onHighlightChanged: (value) {
          isTapped = value;
        },
        onTap: () {
          showBottom(context, tabController);
          arrowAnimationController.isCompleted
              ? arrowAnimationController.reverse()
              : arrowAnimationController.forward();
        },
        child: AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            curve: Curves.fastLinearToSlowEaseIn,
            height: isTapped ? 45 : 50,
            width: isTapped ? 45 : 50,
            decoration: BoxDecoration(
              color: const Color(0xff48319D),
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  blurRadius: 30,
                  offset: const Offset(5, 5),
                )
              ],
            ),
            child: AnimatedBuilder(
              animation: arrowAnimationController,
              builder: (context, child) => Transform.rotate(
                angle: arrowAnimation.value,
                child: const Icon(
                  Icons.expand_more,
                  size: 30.0,
                  color: Colors.white,
                ),
              ),
            )),
      ),
    );
  }
}
