import 'package:firebase_authentication/widgets/progress_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:linear_progress_bar/linear_progress_bar.dart';

class GoalsScreen extends StatelessWidget {
  const GoalsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int currentStep = 1;
    return  Scaffold(
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
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                color:const Color(0xFF20B9FC),
                borderRadius: BorderRadius.circular(10)
              ),
              child: const Icon(Icons.message,color: Colors.white,),
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 30,top: 50,right: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Goals',style: TextStyle(fontSize: 33,fontWeight: FontWeight.bold),),
            const SizedBox(height: 40,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children:  [
                 const Text('Gain Weight',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold)),
                Container(
                  height: 4,
                  width: MediaQuery.of(context).size.width * .1,
                  child: LinearProgressBar(
                    maxSteps: 3,
                    progressType: LinearProgressBar.progressTypeLinear,
                    currentStep: currentStep,
                    progressColor:  Colors.black,
                    backgroundColor: const Color(0xFFE4E4E4),
                    valueColor: const AlwaysStoppedAnimation<Color>(Color(0xFF999B9F)),
                    semanticsLabel: "Label",
                    semanticsValue: "Value",
                    minHeight: 4,
                  ),
                )
              ],
            ),
            const SizedBox(height: 50,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                 Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                          // crossAxisAlignment: CrossAxisAlignment.baseline,
                        children: const [
                          Text('72',style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold),), Text('kg'),
                        ],
                      ),
                      const Text('current'),
                    ],
                  ),
                ),
                const Icon(Icons.arrow_forward),
                Container(
                  margin: const EdgeInsets.only(right: 50),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        // crossAxisAlignment: CrossAxisAlignment.baseline,
                        children: const [
                          Text('72',style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold),), Text('kg'),
                        ],
                      ),
                      const Text('Goal'),
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
