import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'custom_widgets.dart';
import 'constant.dart';
import 'result_screen.dart';
import 'package:bmi_calculator/BMI_brain_calculation.dart';

enum Gender { male, female }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selected_gender;

  int _currentSliderValue = 120;
  int _weight = 55;
  int _age = 20;
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
                          ? KactiveCardColor
                          : Kinactiveclr,
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
                          ? KactiveCardColor
                          : Kinactiveclr,
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
                      style: KlabelTextStyle,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      mainAxisAlignment: MainAxisAlignment.center,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(
                          _currentSliderValue.toString(),
                          style: Knumber_text_style,
                        ),
                        Text(
                          'cm',
                          style: TextStyle(
                              fontSize: 14.0, fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                          thumbShape:
                              RoundSliderThumbShape(enabledThumbRadius: 15),
                          overlayShape:
                              RoundSliderOverlayShape(overlayRadius: 30),
                          thumbColor: Kbottom_button,
                          overlayColor:
                              Kbottom_button.withAlpha(0x29), // opacity ta3 16%
                          activeTrackColor: Colors.white,
                          inactiveTrackColor: Kinactive_slider_color),
                      child: Slider(
                        inactiveColor: Kinactiveclr,
                        value: _currentSliderValue.toDouble(),
                        min: 120.0,
                        max: 220.0,
                        label: _currentSliderValue.round().toString(),
                        onChanged: (double value) {
                          setState(() {
                            _currentSliderValue = value.round();
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: custom_container(
                      clr: Color(0xFF1D1E33),
                      child_cont: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'WEIGHT',
                            style: KlabelTextStyle,
                          ),
                          Text(
                            _weight.toString(),
                            style: Knumber_text_style,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              RoundedIconButton(
                                icon_button: FontAwesomeIcons.minus,
                                function: () {
                                  setState(() {
                                    _weight--;
                                  });
                                },
                              ),
                              RoundedIconButton(
                                  icon_button: FontAwesomeIcons.plus,
                                  function: () {
                                    setState(() {
                                      _weight++;
                                    });
                                  })
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: custom_container(
                      clr: Color(0xFF1D1E33),
                      child_cont: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'AGE',
                            style: KlabelTextStyle,
                          ),
                          Text(
                            _age.toString(),
                            style: Knumber_text_style,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              RoundedIconButton(
                                  icon_button: FontAwesomeIcons.minus,
                                  function: () {
                                    setState(() {
                                      _age--;
                                    });
                                  }),
                              RoundedIconButton(
                                  icon_button: FontAwesomeIcons.plus,
                                  function: () {
                                    setState(() {
                                      _age++;
                                    });
                                  }),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Buttom_container(
              text: 'Calculate',
              onPress: () {
                CalculatorBrain bmi_result = CalculatorBrain(
                    height: _currentSliderValue, weight: _weight);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => result_screen(
                              BMI_result: bmi_result.calculateBMI(),
                              text: bmi_result.getResult(),
                              interpretation: bmi_result.getInterpretation(),
                            )));
              },
            )
          ],
        ),
      ),
    );
  }
}

class RoundedIconButton extends StatelessWidget {
  RoundedIconButton({@required this.icon_button, @required this.function});
  final IconData icon_button;
  final Function function;
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
        onPressed: function,
        constraints: BoxConstraints.tightFor(
          width: 56.0,
          height: 56.0,
        ),
        elevation: 6.0,
        shape: CircleBorder(),
        fillColor: Color(0xFF4C4F5E),
        child: Icon(icon_button));
  }
}
