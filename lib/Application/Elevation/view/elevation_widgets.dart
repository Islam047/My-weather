import 'package:flutter/material.dart';

import '../../../Constants/constants_textstyle.dart';

class AstroItem extends StatelessWidget {
  final String image;
  final String title;
  final String time;

  const AstroItem(
      {Key? key, required this.image, required this.title, required this.time})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      width: double.infinity,
      height: 150,
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
      child: Card(

        child: Row(

          children: [
            Expanded(child: ClipRRect(borderRadius: const BorderRadius.only(topRight: Radius.circular(30),bottomRight: Radius.circular(30)),child: Image.asset(image,height: 100,width: 100,fit: BoxFit.cover,)),),
            Expanded(child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
              Text(title,style: Style.styleEight,),
              Text(time,style: Style.styleNine,),
            ],)),
          ],
        ),
      ),
    );
  }
}
