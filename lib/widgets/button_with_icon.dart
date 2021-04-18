import 'package:flutter/material.dart';
import 'package:doodle_demo_app/constants.dart';

class ButtonWithIcon extends StatelessWidget {

  ButtonWithIcon({this.icon, this.name, this.onTap});

  IconData icon;
  String name;
  Function onTap;

  @override
  Widget build(BuildContext context) {

    return InkWell(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Icon(icon, color: Colors.white),
          Text(
            name,
            style: kLabelTextStyle.copyWith(fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}
