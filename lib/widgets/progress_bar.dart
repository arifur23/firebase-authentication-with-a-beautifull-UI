import 'package:flutter/material.dart';
import 'package:linear_progress_bar/linear_progress_bar.dart';

class ProgressBar extends StatefulWidget {
  const ProgressBar({Key? key}) : super(key: key);

  @override
  _ProgressBarState createState() => _ProgressBarState();
}

class _ProgressBarState extends State<ProgressBar> {

  int currentStep = 1;

  @override
  Widget build(BuildContext context) {
    return  Column(
        children: [
          Container(
            height: 12,
            width: MediaQuery.of(context).size.width * .1,
            child: LinearProgressBar(
              maxSteps: 4,
              progressType: LinearProgressBar.progressTypeLinear,
              currentStep: currentStep,
              progressColor: Colors.red,
              backgroundColor: Colors.grey,
              valueColor: const AlwaysStoppedAnimation<Color>(Colors.red),
              semanticsLabel: "Label",
              semanticsValue: "Value",
              minHeight: 10,
            ),
          ),
          TextButton(
              onPressed: (){
                setState(() {
                  if(currentStep < 4){
                    currentStep++;
                  }
                  else{
                    currentStep = 0;
                  }
                });
              },
              child: const Text('increase'))
        ],
      );
  }
}
