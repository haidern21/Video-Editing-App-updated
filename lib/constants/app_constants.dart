import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

const String appTitleName = 'VideoEditingApp';

const String appFontFamilyName = 'WorkSans';

// ignore: constant_identifier_names
const String BASE_URL = 'https://video-editing-app.herokuapp.com/api/';

final BuildContext context = navigatorKey.currentState!.context;

double width = MediaQuery.of(context).size.width;
double height = MediaQuery.of(context).size.height;
final sp = MediaQuery.of(context).textScaleFactor;
