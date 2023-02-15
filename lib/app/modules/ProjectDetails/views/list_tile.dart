import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../../constants/colors.dart';
import '../controllers/project_details_controller.dart';

class ListTileItem extends StatefulWidget {
  var icons;
  ListTileItem();
  @override
  _ListTileItemState createState() => new _ListTileItemState();
}

class _ListTileItemState extends State<ListTileItem> {
  ProjectDetailsController controller = Get.put(ProjectDetailsController());

  bool changeColor = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          changeColor = !changeColor;
          controller.visible();
        });
      },
      child: Icon(
        Icons.check,
        color: changeColor == false ? Colors.grey : kcomplete,
      ),
    );
  }
}
