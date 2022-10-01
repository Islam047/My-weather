import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../Constants/constants_textstyle.dart';


class ForecastBottomItem extends StatelessWidget {
  final String time;
  final String icon;
  final String tmp;
  final bool timeOf;
  const ForecastBottomItem(
      {Key? key, required this.time, required this.icon, required this.tmp, required this.timeOf})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5),
      width: 70,
      height: 70,
      decoration: BoxDecoration(
        color: timeOf ? properColorTime(time) : properColorDay(time),
        border: Border.all(
            width: 1,
            color: Colors.white
        ),
        borderRadius: BorderRadius.circular(25),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          timeOf ?  properTextTime(time) : properTextDay(time),
          Image.network("https:$icon"), Text("$tmp °",style: Style.styleFour,)],
      ),
    );
  }
// 'H'
  Widget properTextTime(time) {
    final DateTime now = DateTime.parse(time);
    final DateTime myNow = DateTime.now();
    final DateFormat formatter = DateFormat('H');
    final DateFormat formatterMy = DateFormat('Hm');
    if (formatter.format(myNow) == formatter.format(now)) {
      return  Text("Now",style: Style.styleFour,);
    } else {
      return Text(formatterMy.format(now),style: Style.styleFour,);
    }
  }
  Color? properColorTime(time) {
    final DateTime now = DateTime.parse(time);
    final DateTime myNow = DateTime.now();
    final DateFormat formatter = DateFormat('H');
    if (formatter.format(myNow) == formatter.format(now)) {
      return  const Color(0xff2E335A);
    } else {
      return null;
    }
  }

  Widget properTextDay(time) {
    final DateTime now = DateTime.parse(time);
    final DateTime myNow = DateTime.now();
    final DateFormat formatter = DateFormat('E d');
    if (formatter.format(myNow) == formatter.format(now)) {
      return  Text("Now",style: Style.styleFour,);
    } else {
      return Text(formatter.format(now),style: Style.styleFour,textAlign: TextAlign.center,) ;
    }

  }
  Color? properColorDay(time) {
    final DateTime now = DateTime.parse(time);
    final DateTime myNow = DateTime.now();
    final DateFormat formatter = DateFormat('E d');
    if (formatter.format(myNow) == formatter.format(now)) {
      return   const Color(0xff2E335A);
    } else {
      return null;
    }
  }
}

void showBottom(BuildContext context, TabController controller) {
  showModalBottomSheet(
      backgroundColor: Colors.transparent,
      context: context,
      builder: (context) {
        return Container(
          padding: const EdgeInsets.only(bottom: 50),
          decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
                  const Color(0xff2E335A).withOpacity(0.9),
                  const Color(0xff1c1b33).withOpacity(0.9),
                ],
              ),
              borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(25),
                  topLeft: Radius.circular(25))),
          height: MediaQuery.of(context).size.height / 2.5,
          width: double.infinity,
          child: Column(
            children: [
              TabBar(
                indicatorColor: Colors.black26,
                labelColor: Colors.white,
                controller: controller,
                tabs: const [
                  Tab(
                    text: "Hourly forecast",
                  ),
                  Tab(
                    text: "Daily forecast",
                  ),
                ],
              ),
              Expanded(
                child: TabBarView(
                  physics: const NeverScrollableScrollPhysics(),
                  controller: controller,
                  children: [
                    ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 10,
                        itemBuilder: (context, index) {
                          return const ForecastBottomItem(
                            time: "2022-09-21 23:24",
                            icon:
                            "//cdn.weatherapi.com/weather/64x64/day/113.png",
                            tmp: "19",
                            timeOf: true,
                          );
                        }),
                    ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 10,
                        itemBuilder: (context, index) {
                          return const ForecastBottomItem(
                            time: "2022-09-21 22:24",
                            icon:
                            "//cdn.weatherapi.com/weather/64x64/day/113.png",
                            tmp: "19",
                            timeOf: false,
                          );
                        }),

                  ],
                ),
              )
            ],
          ),
        );
      });
}