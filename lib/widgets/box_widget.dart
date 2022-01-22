import 'package:flutter/material.dart';

class BoxWidget extends StatelessWidget {

  final String title;
  final String description;
  final Color color;
  final String unit;

  const BoxWidget({Key? key, required this.title, required this.description, required this.color, required this.unit}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 167,
      width: 167,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: color
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 40,left: 35),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                 Text(description,style: const TextStyle(color: Colors.white,fontSize: 35,fontWeight: FontWeight.bold),),
                Text(unit,style: TextStyle(color: Colors.white.withOpacity(.6)),)
              ],
            ),
            const SizedBox(height: 10,),
            Text(title,style: TextStyle(fontSize: 15,color: Colors.white.withOpacity(.6)),)
          ],
        ),
      ),
    );
  }
}
