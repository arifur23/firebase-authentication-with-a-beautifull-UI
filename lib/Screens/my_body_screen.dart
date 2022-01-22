import 'package:firebase_authentication/widgets/ad_box_widget.dart';
import 'package:firebase_authentication/widgets/box_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyBodyScreen extends StatefulWidget {
  const MyBodyScreen({Key? key}) : super(key: key);

  @override
  _MyBodyScreenState createState() => _MyBodyScreenState();
}

class _MyBodyScreenState extends State<MyBodyScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(left: 25,top: 10),
          child: IconButton(
            icon: const Icon(Icons.arrow_back_ios,size: 20,color: Colors.black,),
            onPressed: (){
              Navigator.pop(context);
            },
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 5),
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 5,vertical: 5),
              height: 30,
              width: 30,
              decoration: BoxDecoration(
                  color:const Color(0xFF20B9FC),
                  borderRadius: BorderRadius.circular(7)
              ),
              child: const Icon(Icons.message,color: Colors.white,size: 15,),
            ),
          )
        ],
      ),
      body: ListView(
        scrollDirection: Axis.vertical,
        physics: const BouncingScrollPhysics(),
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 30,top: 50,right: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('My Body',style: TextStyle(fontSize: 35,fontWeight: FontWeight.bold)),
                const SizedBox(height: 50,),
                const Text('Basics',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold)),
                const SizedBox(height: 30,),
                Column(
                  children: [
                    Row(
                      children: const [
                        BoxWidget(unit: 'kg',title: 'Weight',description: '72', color: Color(0xFFFC6B21),),
                        SizedBox(width: 15,),
                        BoxWidget(unit: 'cm',title: 'Height',description: '175', color: Color(0xFF5732FB),),
                      ],
                    ),
                    const SizedBox(height: 15,),
                    Container(
                      height: 162,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: const Color(0xFF20B9FC)
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 33,top: 50),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children:  [
                            const Text('Boxing, Gym, Running',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.white),),
                            const SizedBox(height: 10,),
                            Text('Experience',style: TextStyle(color: Colors.white.withOpacity(.6)),)
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 20,),
                    Column(
                      children: [
                        Row(
                          children: const [
                            Icon(Icons.lock),
                            SizedBox(width: 15,),
                            Text('Advanced',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),)
                          ],
                        ),
                        const SizedBox(height: 20,),
                        Row(
                          children: const[
                            AdBoxWidget(color: Color(0xFFFC6C22),),
                            SizedBox(width: 15,),
                            AdBoxWidget(color: Color(0xFF20B9FC),)
                          ],
                        )
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
          const SizedBox(height: 20,)
        ],
      ),
    );
  }
}

