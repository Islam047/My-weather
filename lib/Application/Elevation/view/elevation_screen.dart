import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

import '../../../Constants/constants_textstyle.dart';
import 'elevation_widgets.dart';

class ElevationScreen extends StatelessWidget {
   ElevationScreen({Key? key}) : super(key: key);
 final List<String> itemImages = ["assets/images/sunrise.png","assets/images/sunset.png","assets/images/moonrise.png","assets/images/moonset.png","assets/images/moon_phase.png","assets/images/moon_illumination.png"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: const Color(0xff45278B),
        centerTitle: false,
        title: Padding(
          padding: const EdgeInsets.only(left: 50),
          child: Text(
            "Astronomy",
            style: Style.styleFive,
          ),
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(80),
          child: SizedBox(
            height: 60,
            width: MediaQuery.of(context).size.width,
            child: Image.asset(
              "assets/images/astro_photo.png",
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
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
                  AstroItem(image: itemImages[0], title: "Sunrise", time: "time"),
                  AstroItem(image: itemImages[1], title: "Sunset", time: "time"),
                  AstroItem(image: itemImages[2], title: "Moonrise", time: "time"),
                  AstroItem(image: itemImages[3], title: "Moonset", time: "time"),
                  AstroItem(image: itemImages[4], title: "Moon Phase", time: "time"),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/*

 static Future<void> makeGithub() async {
   final Uri launchUri = Uri(
     scheme: 'https',
     path: "github.com/Islam047",
   );
   await launchUrl(launchUri);
 }
 */