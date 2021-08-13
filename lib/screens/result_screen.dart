import 'package:bmi_calculator/main.dart';
import 'package:flutter/material.dart';
import '../constants/constant.dart';
import 'inputPage.dart';
import '../custom widgets/custom_widgets.dart';
import 'package:bmi_calculator/BMI_brain_calculation.dart';

class result_screen extends StatelessWidget {
  result_screen({this.BMI_result, this.text, this.interpretation});

  final String BMI_result;
  final String text;
  final String interpretation;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('BMI CALCULATOR')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
              child: Padding(
            padding: const EdgeInsets.only(top: 20.0, left: 10.0),
            child: Text(
              'You Results :',
              style: BMI_result_text,
            ),
          )),
          Expanded(
            flex: 5,
            child: custom_container(
              clr: KactiveCardColor,
              child_cont: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    text,
                    style: TextStyle(color: Colors.green, fontSize: 25.0),
                  ),
                  SizedBox(
                    height: 60.0,
                  ),
                  Text(
                    BMI_result,
                    style: BMI_result_text_style,
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      interpretation,
                      style: TextStyle(
                        fontSize: 18.0,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          Buttom_container(
            text: 're-calculate',
            onPress: () {
              Navigator.pop(context, true);
            },
          )
        ],
      ),
    );
  }
}
