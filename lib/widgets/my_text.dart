import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class MyText extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  var text, color, weight, align, decoration, fontFamily, shadow;
  double? size, height;
  double? paddingTop, paddingLeft, paddingRight, paddingBottom;

  // ignore: prefer_typing_uninitialized_variables
  var maxLines, overFlow;

  MyText({
    Key? key,
    @required this.text,
    this.shadow,
    this.size,
    this.height,
    this.maxLines = 100,
    this.decoration = TextDecoration.none,
    this.color = Colors.black,
    this.weight = FontWeight.w400,
    this.align,
    this.overFlow,
    this.fontFamily = 'WorkSans',
    this.paddingTop = 0,
    this.paddingRight = 0,
    this.paddingLeft = 0,
    this.paddingBottom = 0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: paddingTop!,
        left: paddingLeft!,
        right: paddingRight!,
        bottom: paddingBottom!,
      ),
      child: Text(
        "$text",
        style: TextStyle(
            fontSize: size,
            color: color,
            fontWeight: weight,
            decoration: decoration,
            fontFamily: '$fontFamily',
            height: height,
            shadows: shadow),
        textAlign: align,
        maxLines: maxLines,
        overflow: overFlow,
      ),
    );
  }
}
