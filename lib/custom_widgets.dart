import 'package:flutter/material.dart';
import 'constant.dart';

class container_child_reusable extends StatelessWidget {
  container_child_reusable({@required this.text, @required this.icon});
  final List<Widget> list_wid = [];
  final String text;
  final IconData icon;
  final Color inactiveclr = Color(0xFF111328);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 80.0,
        ),
        SizedBox(
          height: 15.0,
        ),
        Text(
          text,
          style: labelTextStyle,
        )
      ],
    );
  }
}

class custom_container extends StatelessWidget {
  custom_container({@required this.clr, this.child_cont, this.onpress});
  final Color clr;
  final Function onpress;

  final Widget child_cont;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onpress,
      child: Container(
        child: child_cont,
        margin: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: clr,
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
