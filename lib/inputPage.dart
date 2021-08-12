import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'custom_widgets.dart';

const activeCardColor = Color(0xFF1D1E33);
const inactiveclr = Color(0xFF111328);
const bottom_button = Color(0xFFEB1555);
enum Gender { male, female }

class InputPage extends StatefulWidget {
  var currentSliderValue = 20;

  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selected_gender;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selected_gender = Gender.male;
                      });
                    },
                    child: custom_container(
                      clr: selected_gender == Gender.male
                          ? activeCardColor
                          : inactiveclr,
                      child_cont: container_child_reusable(
                          icon: FontAwesomeIcons.mars, text: 'MALE'),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selected_gender = Gender.female;
                      });
                    },
                    child: custom_container(
                      clr: selected_gender == Gender.female
                          ? activeCardColor
                          : inactiveclr,
                      child_cont: container_child_reusable(
                        icon: FontAwesomeIcons.venus,
                        text: 'FEMALE',
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: custom_container(clr: Color(0xFF1D1E33)),
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
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
      ),
    );
  }
}
