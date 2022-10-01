import 'package:flutter/material.dart';
import 'package:my_weather/Application/AirQuality/view/air_quality_widgets.dart';
import 'package:my_weather/Constants/constants_textstyle.dart';

class AirQualityScreen extends StatelessWidget {
  const AirQualityScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: const Color(0xff45278B),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: const Color(0xff45278B),
        centerTitle: false,
        title: Padding(
          padding: const EdgeInsets.only(left: 50),
          child: Text("Air quality",style: Style.styleFive,),
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(80),
          child: Padding(
            padding: const EdgeInsets.only(left: 20,right: 20),
            child: Container(
              margin: const EdgeInsets.all(20),
              height: 45,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: const Color(0xff2E335A),
                  border: Border.all(
                   width: 2,
                   color: Colors.black26,
                 ),
                  borderRadius: BorderRadius.circular(10)

              ),
              child:   TextField(
                style: Style.styleSix,
                decoration:  const InputDecoration(
                  hintText: "Enter city name",
                  // hintStyle: Style.styleSix,
                  border: InputBorder.none,
                  prefixIcon: Icon(Icons.search)
                ),
              ),
            ),
          ),
        ),
      ),

      body: const CardColumnScreen(),
    );
  }
}
