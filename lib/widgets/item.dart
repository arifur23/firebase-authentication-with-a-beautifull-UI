import 'package:flutter/material.dart';

class Item extends StatelessWidget {
  const Item({Key? key, required this.iconData, required this.boxColor, required this.iconColor, required this.title, required this.onPressed}) : super(key: key);
  final IconData iconData;
  final Color boxColor;
  final Color iconColor;
  final String title;

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children:  [
          Row(
            children: [
              Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: boxColor
                ),
                child:  Icon(iconData,color: iconColor,),
              ),
              const SizedBox(width:25),
               Text(title,style: const TextStyle(fontWeight: FontWeight.bold,),),
            ],
          ),
          GestureDetector(
            onTap: onPressed,
            child: Container(
              height: 50,
              width: 50,
              decoration:  BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: const Color(0xFFF6F5F7)
              ),
              child: const Icon(Icons.arrow_forward_ios,color: Colors.black,size: 15,),
            ),
          )
        ],
      ),
    );
  }
}
