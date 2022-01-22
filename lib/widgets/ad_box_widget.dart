import 'package:flutter/material.dart';

class AdBoxWidget extends StatelessWidget {
  const AdBoxWidget({
    Key? key, required this.color,
  }) : super(key: key);
  final Color color;

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
          children: const [
            Icon(Icons.circle,color: Colors.white,)
          ],
        ),
      ),
    );
  }
}

