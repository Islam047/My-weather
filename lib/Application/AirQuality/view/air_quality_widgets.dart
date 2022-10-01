import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:my_weather/Constants/constants_textstyle.dart';

class CardColumnScreen extends StatefulWidget {
  const CardColumnScreen({Key? key}) : super(key: key);

  @override
  CardColumnScreenState createState() => CardColumnScreenState();
}

class CardColumnScreenState extends State<CardColumnScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: AnimationLimiter(
            child: Column(
              children: AnimationConfiguration.toStaggeredList(
                duration: const Duration(milliseconds: 1000),
                childAnimationBuilder: (widget) => SlideAnimation(
                  horizontalOffset: MediaQuery.of(context).size.width / 2,
                  child: FadeInAnimation(child: widget),
                ),
                children: [
                  // Card(
                  //   width: MediaQuery.of(context).size.width,
                  //   height: 160.0,
                  // ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Card(
                            height: 164.0,
                            width: MediaQuery.of(context).size.width / 2.5),
                        Card(
                            height: 164.0,
                            width: MediaQuery.of(context).size.width / 2.5),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Card(
                            height: 164.0,
                            width: MediaQuery.of(context).size.width / 2.5),
                        Card(
                            height: 164.0,
                            width: MediaQuery.of(context).size.width / 2.5),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Card(
                            height: 164.0,
                            width: MediaQuery.of(context).size.width / 2.5),
                        Card(
                            height: 164.0,
                            width: MediaQuery.of(context).size.width / 2.5),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Card(
                            height: 164.0,
                            width: MediaQuery.of(context).size.width / 2.5),
                        Card(
                            height: 164.0,
                            width: MediaQuery.of(context).size.width / 2.5),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class Card extends StatelessWidget {
  final double? width;
  final double? height;
  final String? textOne;
  final String? textTwo;

  const Card({
    Key? key,
    this.width,
    this.height,
    this.textOne,
    this.textTwo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      width: width,
      height: height,
      margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
      decoration: const BoxDecoration(
        color: Color(0xff2E335A),
        borderRadius: BorderRadius.all(Radius.circular(7)),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black12,
            blurRadius: 4.0,
            offset: Offset(0.0, 4.0),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Elements",style: Style.styleThree,),
          Text("$textOne ",style: Style.styleSix,),
          Text("150.0",style: Style.styleSeven,),
        ],
      ),
    );
  }
}
