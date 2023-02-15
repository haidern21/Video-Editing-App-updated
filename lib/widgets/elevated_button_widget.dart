import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:video_editing_app/widgets/box_shadow.dart';
import '../constants/colors.dart';
import 'my_text.dart';

class MyButton extends StatelessWidget {
  final color;
  final text;
  var size;
  var weight;
  var textColor;
  var borderColor;

  VoidCallback? onPress;
  MyButton({
    Key? key,
    this.textColor,
    this.borderColor = kprimaryColor,
    this.color = kprimaryColor,
    this.text,
    this.size,
    this.onPress,
    this.weight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          side: BorderSide(color: borderColor),
          borderRadius: BorderRadius.circular(55),
        ),
        elevation: 0,
        backgroundColor: color,
      ),
      onPressed: onPress,
      child: Center(
        child: MyText(
          align: TextAlign.center,
          text: '$text',
          size: size,
          weight: weight,
          color: textColor,
          fontFamily: 'WorkSans',
        ),
      ),
    );
  }
}
