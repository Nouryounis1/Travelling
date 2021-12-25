import 'package:flutter/material.dart';
import 'package:travel_app/misc/colors.dart';
import 'package:travel_app/widgets/app_text.dart';

class AppButtons extends StatelessWidget {
  final Color color;
  final Color backgroundColor;
  final Color borderColor;
  bool? isIcon;
  String? text;
  IconData? icon;

  double size;
  AppButtons(
      {Key? key,
      this.isIcon = false,
      this.text = 'Hi',
      this.icon,
      required this.color,
      required this.backgroundColor,
      required this.size,
      required this.borderColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        border: Border.all(color: borderColor, width: 1.0),
        borderRadius: BorderRadius.circular(15),
        color: backgroundColor,
      ),
      child: isIcon == false
          ? Center(child: AppText(text: text!, color: color))
          : Center(
              child: Icon(
                icon,
                color: color,
              ),
            ),
    );
  }
}
