import 'package:flutter/material.dart';

import '../constants/colors.dart';

var enabledborder = OutlineInputBorder(
  borderRadius: BorderRadius.circular(8.0),
  borderSide: BorderSide(color: kgrey3, width: 1.0),
);

var errorborder = OutlineInputBorder(
  borderRadius: BorderRadius.circular(8.0),
  borderSide: BorderSide(color: kcancel, width: 1.0),
);
var focusedborder = OutlineInputBorder(
  borderRadius: BorderRadius.circular(8.0),
  borderSide: BorderSide(color: kcomplete, width: 1.0),
);
