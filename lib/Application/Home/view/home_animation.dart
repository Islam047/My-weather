import 'package:animated_background/animated_background.dart';
import 'package:flutter/material.dart';

class Background extends StatefulWidget {
   const Background({Key? key,required this.child,required this.behaviour}) : super(key: key);
final  Widget child;
   final Behaviour behaviour;

  @override
  BackgroundState createState() => BackgroundState();
}

class BackgroundState extends State<Background>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return AnimatedBackground(
      behaviour: widget.behaviour,
      vsync: this,
      child: widget.child,

    );
  }
}