import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'custom_widgets.dart';
import 'constant.dart';

const activeCardColor = Color(0xFF1D1E33);
const inactiveclr = Color(0xFF111328);
const bottom_button = Color(0xFFEB1555);
enum Gender { male, female }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selected_gender;
  double _currentSliderValue = 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: custom_container(
                      onpress: () {
                        setState(() {
                          selected_gender = Gender.male;
                        });
                      },
                      clr: selected_gender == Gender.male
                          ? activeCardColor
                          : inactiveclr,
                      child_cont: container_child_reusable(
                          icon: FontAwesomeIcons.mars, text: 'MALE'),
                    ),
                  ),
                  Expanded(
                    child: custom_container(
                      onpress: () {
                        setState(() {
                          selected_gender = Gender.female;
                        });
                      },
                      clr: selected_gender == Gender.female
                          ? activeCardColor
                          : inactiveclr,
                      child_cont: container_child_reusable(
                        icon: FontAwesomeIcons.venus,
                        text: 'FEMALE',
                      ),
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child: custom_container(
                clr: Color(0xFF1D1E33),
                child_cont: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'HEIGHT',
                      style: labelTextStyle,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          _currentSliderValue.toString(),
                          style: TextStyle(
                              fontSize: 50.0, fontWeight: FontWeight.bold),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 23.0),
                          child: Text(
                            'cm',
                            style: TextStyle(
                                fontSize: 14.0, fontWeight: FontWeight.bold),
                          ),
                        )
                      ],
                    ),
                    Slider(
                      activeColor: bottom_button,
                      value: _currentSliderValue,
                      min: 0,
                      max: 200,
                      divisions: 10,
                      label: _currentSliderValue.round().toString(),
                      onChanged: (double value) {
                        setState(() {
                          _currentSliderValue = value;
                        });
                      },
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: custom_container(clr: Color(0xFF1D1E33)),
                  ),
                  Expanded(
                    child: custom_container(clr: Color(0xFF1D1E33)),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
      ),
    );
  }
}
