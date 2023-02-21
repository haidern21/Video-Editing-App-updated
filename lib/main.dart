import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:video_editing_app/app/data/hive/hive_io.dart';
import 'package:video_editing_app/constants/app_constants.dart';
import 'package:video_editing_app/constants/colors.dart';

import 'app/routes/app_pages.dart';
String emptyUserImage =
    'https://cdn-icons-png.flaticon.com/512/3135/3135715.png';
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
  );
  initialize();
  initHiveDatabase(isDebug: false);

  runApp(
    GetMaterialApp(
      navigatorKey: navigatorKey,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: appFontFamilyName,
        scaffoldBackgroundColor: kScaffoldBackgroundColor,
      ),
      title: appTitleName,
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    ),
  );
}
