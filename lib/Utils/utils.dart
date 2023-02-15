// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constants/colors.dart';

class GlobalListTileItem extends StatefulWidget {
  var icons;
  GlobalListTileItem({
    Key? key,
    this.icons,
  }) : super(key: key);
  @override
  _GlobalListTileItemState createState() => _GlobalListTileItemState();
}

class _GlobalListTileItemState extends State<GlobalListTileItem> {
  bool changeColor = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          changeColor = !changeColor;
        });
      },
      child: Icon(
        Icons.check,
        color: changeColor == false ? Colors.grey : kcomplete,
      ),
    );
  }
}
